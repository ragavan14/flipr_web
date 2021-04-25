<?php       
    $keyword = strval($_POST['query']);
    $search_param = "{$keyword}%";
    $conn =new mysqli('localhost', 'root', '' , 'ipldb');

    $sql = $conn->prepare("SELECT * FROM players WHERE name LIKE ?");
    $sql->bind_param("s",$search_param);            
    $sql->execute();
    $result = $sql->get_result();
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
        $playerResult[] = $row["name"];
        }
        echo json_encode($playerResult);
    }
    $conn->close();
?>
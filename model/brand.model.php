<?

class brand {

    public $name, $id;

    public function newBrand(){
        $get = $db->prepare(" INSERT INTO brand(name) VALUES ('this->$name')  ");
        if($get->execute()){
        return true;
        }else {
        return false;
        }
    }
    public function updateBrand(){
        global $db;
        $get = $db->prepare(" UPDATE brand SET name = 'this->$name' WHERE bid = 'this->$id' ");
        if($get->execute()){
        return true;
        }else {
        return false;
        }
    }

    public function deleteBrand(){
        global $db;
        $get = $db->prepare(" DELETE FROM brand WHERE bid = 'this->$id' ");
        if($get->execute()){
        return true;
        }else {
        return false;
        }
    }

    //public function searchbrand(){}

    public function getbrand($bid){
        global $db;
        $get = $db->prepare(" SELECT name FROM brand WHERE bid ='this->$bid' ");
        $get->execute();
        $row = $get->fetch(PDO::FETCH_ASSOC);
        return $row['name'];
    }

    public function getallbrands(){
        global $db;
        $result = array();
        $get = $db->prepare(" SELECT * FROM brand  ");
        $get->execute();
        while($row = $get->fetch(PDO::FETCH_ASSOC)){
            $row = array_map('stripslashes', $row);
            $result[] = $row;
        }
        return $result;
    }
}

?>
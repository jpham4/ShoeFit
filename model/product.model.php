<?

class product{
    public $name, $qte, $price, $brandId, $desc, $img ;

    public function newproduct(){
        $get = $db->prepare(" INSERT INTO product (name, qte, price, description,img,bid) VALUES ('this->$name','this->$qte', 'this->$price','this->$desc','this->$img','this->$brandId')  ");
        if($get->execute()){
          return true;
        }else {
          return false;
        }
    }
    public function updateproduct(){}
    
    public function deleteproduct($id){
        global $db;
        $get = $db->prepare(" DELETE FROM product WHERE pid='$id' ");
        if($get->execute()){
          return true;
        }else {
          return false;
        }
    }
    
    public function searchproduct(){}
    
    public function getproduct($id){
        global $db;
        $result = array();
        $get = $db->prepare(" SELECT * FROM product WHERE pid='$id' ");
        $get->execute();
        while($row = $get->fetch(PDO::FETCH_ASSOC)){
            $row = array_map('stripslashes', $row);
            $result[] = $row;
        }
        return $result;
        
    }

    public function getproductbybrand($bid){
        global $db;
        $result = array();
        $get = $db->prepare(" SELECT * FROM product WHERE bid='$bid' ");
        $get->execute();
        while($row = $get->fetch(PDO::FETCH_ASSOC)){
            $row = array_map('stripslashes', $row);
            $result[] = $row;
        }
        return $result;
    }

    public function getallproduct(){
        global $db;
        $result = array();
        $get = $db->prepare(" SELECT * FROM product ");
        $get->execute();
        while($row = $get->fetch(PDO::FETCH_ASSOC)){
            $row = array_map('stripslashes', $row);
            $result[] = $row;
        }
        return $result;
    }
}


?>
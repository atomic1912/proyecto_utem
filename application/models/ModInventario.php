<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ModInventario extends CI_Model {
	public function __construct(){
		parent::__construct();
	}

	public function init($dataBase){
		$this->db = $this->load->database($dataBase, TRUE);
	}

	public function getCategorias(){
		$result = $this->db->get('categorias');
		//$result = $this->db->query($query);

		if($result->num_rows() > 0){
			return $result->result_array();
		}else{
			return false;
		}
	}
	public function getUbicaciones(){
		$result = $this->db->get('ubicaciones');
		//$result = $this->db->query($query);

		if($result->num_rows() > 0){
			return $result->result_array();
		}else{
			return false;
		}
	}
	public function getEstados(){
		$result = $this->db->get('estados');
		//$result = $this->db->query($query);

		if($result->num_rows() > 0){
			return $result->result_array();
		}else{
			return false;
		}
	}
	//public function getProductos{}

	public function guardarProducto($data)
    {
        // Obtener los datos del producto
        $nombre_producto = $data['nombre'];
        $descripcion = $data['descripcion'];
        $categoria = $data['categoria'];
        $ubicacion = $data['ubicacion'];
        $estado = $data['estado'];
        $imagenes = json_decode($data['imagenes'], true); // Decodificar JSON de imágenes
        $detalles = json_decode($data['detalles'], true); // Decodificar JSON de detalles

        // Llamada al procedimiento almacenado
        $sql = "CALL registrarProducto(?, ?, ?, ?, ?, ?, ?)";
        $params = [
            $nombre_producto,
            $descripcion,
            $categoria,
            $ubicacion,
            $estado,
            json_encode($imagenes), // Convertir las imágenes a JSON
            json_encode($detalles)  // Convertir detalles a JSON
        ];

        // Ejecutar la consulta
        $query = $this->db->query($sql, $params);

        // Verificar si la consulta fue exitosa
        if ($query) {
            return true; // Retornar true si la inserción fue exitosa
        } else {
            return false; // Retornar false si ocurrió un error
        }
    }
}

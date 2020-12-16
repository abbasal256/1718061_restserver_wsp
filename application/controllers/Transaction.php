<?php
defined('BASEPATH') or exit('No direct script access allowed');
// Don't forget include/define REST_Controller path

/**
 *
 * Controller Transaction
 *
 * This controller for ...
 *
 * @package   CodeIgniter
 * @category  Controller REST
 * @author    Setiawan Jodi <jodisetiawan@fisip-untirta.ac.id>
 * @author    Raul Guerrero <r.g.c@me.com>
 * @link      https://github.com/setdjod/myci-extension/
 * @param     ...
 * @return    ...
 *
 */

use chriskacerguis\RestServer\RestController;

class Transaction extends RESTController
{

  public function __construct()
  {
    parent::__construct();
    $this->load->model('Transaction_model', 'transaction');
  }

  public function index_get()
  {
    $id = $this->get('id_transaction', true);
    if ($id === null) {
      $page = $this->get('page', true);
      $page = (empty($page) ? 1 : $page);
      $total_data = $this->transaction->count();
      $total_page = ceil($total_data / 5);
      $start = ($page - 1) * 5;
      $list =  $this->transaction->get(null, 5, $start);
      if ($list) {
        $data = [
          'status' => true,
          'page' => $page,
          'total data' => $total_data,
          'total page' => $total_page,
          'data' => $list
        ];
      } else {
        $data = [
          'status' => false,
          'msg' => 'Data Tidak di Temukan'
        ];
      }

      $this->response($data, RestController::HTTP_OK);
    } else {
      $data = $this->transaction->get($id);
      if ($data) {
        $this->response([
          'status' => true,
          'data' => $data
        ], RestController::HTTP_OK);
      } else {
        $this->response([
          'status' => false,
          'msg' => $id . ' Data Tidak di Temukan'
        ], RestController::HTTP_NOT_FOUND);
      }
    }
  }
  public function index_post()
  {
    $data = [
      'customer_id' => $this->post('customer_id', true),
      'operator_id' => $this->post('operator_id', true),
      'status' => $this->post('status', true),
      'sound_id' => $this->post('sound_id', true),
      'tanggal_pemakaian' => $this->post('tanggal_pemakaian', true),
      'lama_pemakaian' => $this->post('lama_pemakaian', true),
      'lokasi_pemakaian' => $this->post('lokasi_pemakaian', true),
      'harga' => $this->post('harga', true),
      'dibayar' => $this->post('dibayar', true),
      'status_pembayaran' => $this->post('status_pembayaran', true)
    ];
    $simpan = $this->transaction->add($data);
    if ($simpan['status']) {
      $this->response([
        'status' => true,
        'msg' => $simpan['data'] . ' Data Telah di tambahkan'
      ], RestController::HTTP_CREATED);
    } else {
      $this->response([
        'status' => false,
        'msg' => $simpan['msg']
      ], RestController::HTTP_INTERNAL_ERROR);
    }
  }
  public function index_put()
  {
    $data = [
      'customer_id' => $this->put('customer_id', true),
      'operator_id' => $this->put('operator_id', true),
      'status' => $this->put('status', true),
      'sound_id' => $this->put('sound_id', true),
      'tanggal_pemakaian' => $this->put('tanggal_pemakaian', true),
      'lama_pemakaian' => $this->put('lama_pemakaian', true),
      'lokasi_pemakaian' => $this->put('lokasi_pemakaian', true),
      'harga' => $this->put('harga', true),
      'dibayar' => $this->put('dibayar', true),
      'status_pembayaran' => $this->put('status_pembayaran', true)
    ];
    $id = $this->put('id_transaction', true);
    if ($id === null) {
      $this->response([
        'status' => false,
        'msg' => 'Masukkan Id_transaction'
      ], RestController::HTTP_BAD_REQUEST);
    }
    $simpan = $this->transaction->update($id, $data);
    if ($simpan['status']) {
      $status = (int)$simpan['data'];
      if ($status > 0) {
        $this->response([
          'status' => true,
          'msg' => $simpan['data'] . ' Data Telah di Rubah'
        ], RestController::HTTP_OK);
      } else {
        $this->response([
          'status' => false,
          'msg' => 'Tidak ada data yang di rubah'
        ], RestController::HTTP_BAD_REQUEST);
      }
    } else {
      $this->response([
        'status' => false,
        'msg' => $simpan['msg']
      ], RestController::HTTP_INTERNAL_ERROR);
    }
  }
  public function index_delete()
  {
    $id = $this->delete('id_transaction', true);
    if ($id === null) {
      $this->response([
        'status' => false,
        'msg' => 'Masukkan Id_transaction'
      ], RestController::HTTP_BAD_REQUEST);
    }
    $delete = $this->transaction->delete($id);
    if ($delete['status']) {
      $status = (int)$delete['data'];
      if ($status > 0) {
        $this->response([
          'status' => true,
          'msg' => $delete['data'] . ' Data Telah di Hapus'
        ], RestController::HTTP_OK);
      } else {
        $this->response([
          'status' => false,
          'msg' => 'Tidak ada data yang di hapus'
        ], RestController::HTTP_BAD_REQUEST);
      }
    } else {
      $this->response([
        'status' => false,
        'msg' => $delete['msg']
      ], RestController::HTTP_INTERNAL_ERROR);
    }
  }
}


/* End of file Transaction.php */
/* Location: ./application/controllers/Transaction.php */
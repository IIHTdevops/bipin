<?php

//view_order.php

if (isset($_GET["pdf"]) && isset($_GET['order_id'])) {
    require_once 'pdf.php';
    include('database_connection.php');
    include('function.php');
    if (!isset($_SESSION['type'])) {
        header('location:login.php');
    }
    $output = '';
    $statement = $connect->prepare("
		SELECT * FROM bill_order 
		WHERE inventory_order_id = :inventory_order_id
		LIMIT 1
	");
    $statement->execute(
            array(
                ':inventory_order_id' => $_GET["order_id"]
            )
    );
    $result = $statement->fetchAll();
    foreach ($result as $row) {
        $output .= '
		<table width="100%" border="1" cellpadding="5" cellspacing="0">
			<tr>
				<td colspan="2" align="center" style="font-size:18px"><b>Bill</b></td>
			</tr>
			<tr>
				<td colspan="2">
				<table width="100%" cellpadding="5">
					<tr>
						<td width="65%">
							To,<br />
							<b>RECEIVER (BILL TO)</b><br />
							Name : ' . $row["inventory_order_name"] . '<br />	
							Billing Address : ' . $row["inventory_order_address"] . '<br />
						</td>
						<td width="35%">
							GST No : GST1234567890Z5<br />
							Bill No. : ' . $row["inventory_order_id"] . '<br />
							Bill Date : ' . $row["inventory_order_date"] . '<br />
						</td>
					</tr>
				</table>
				<br />
				<table width="100%" border="1" cellpadding="5" cellspacing="0">
					<tr>
						<th rowspan="2">Sr No.</th>
						<th rowspan="2">Code.</th>
						<th rowspan="2">Product</th>
						<th rowspan="2">Price</th>
						<th rowspan="2">Qty(s)</th>
						<th rowspan="2">Amt.</th>
						<th rowspan="2">Tax (%)</th>
						<th rowspan="2">Net Amt.</th>
					</tr>
                                        <tr>
                                        </tr>
		';
        $statement = $connect->prepare("
			SELECT * FROM bill_order_product 
			WHERE inventory_order_id = :inventory_order_id
		");
        $statement->execute(
                array(
                    ':inventory_order_id' => $_GET["order_id"]
                )
        );
        $product_result = $statement->fetchAll();
        $count = 0;
        $total = 0;
        $total_actual_amount = 0;
        $total_tax_amount = 0;
        $actual_amount_total = 0;
        foreach ($product_result as $sub_row) {
            $count = $count + 1;
            $product_data = fetch_product_details($sub_row['product_id'], $connect);
            $actual_amount = $sub_row["quantity"] * $product_data["bill_base_price"];
            $actual_amount_total = $sub_row["quantity"] * $product_data["bill_net_price"];
            $tax_amount = ($actual_amount * $sub_row["tax"]) / 100;
            $total_product_amount = $actual_amount + $tax_amount;
            $total_actual_amount = $total_actual_amount + $actual_amount;
            $total_tax_amount = $total_tax_amount + $tax_amount;
            $total = $total + $actual_amount_total;
            $output .= '
				<tr>
					<td>' . $count . '</td>
					<td>' . $product_data['pcode'] . '</td>
					<td>' . $product_data['product_name'] . '</td>
					<td aling="right">' . $product_data["bill_base_price"] . '</td>
					<td>' . $sub_row["quantity"] . '</td>
					<td align="right">' . number_format($actual_amount, 2) . '</td>
					<td>' . $sub_row["tax"] . '%</td>
					<td align="right">' . number_format($actual_amount_total, 2) . '</td>
				</tr>
			';
        }
        $output .= '
		<tr>
			<td align="right" colspan="5"><b>Total</b></td>
			<td align="right"><b>' . number_format($total_actual_amount, 2) . '</b></td>
			<td align="right"><b>' . number_format($total_tax_amount, 2) . '</b></td>
			<td align="right"><b>' . number_format($total, 2) . '</b></td>
		</tr>
		';
        $output .= '
						</table>
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<p align="right">----------------------------------------<br />Receiver Signature</p>
						<br />
						<br />
						<br />
					</td>
				</tr>
			</table>
		';
    }
    $pdf = new Pdf();
    $file_name = 'Order-' . $row["inventory_order_id"] . '.pdf';
    $pdf->loadHtml($output);
    $pdf->render();
    $pdf->stream($file_name, array("Attachment" => false));
}
?>
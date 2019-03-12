function format ( d ) {
    // `d` is the original data object for the row
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
        '<tr>'+
            '<td>Image</td>'+
            '<td>Landmark Name</td>'+
            '<td>Lat</td>'+
            '<td>Lng</td>'+
            '<td>Lng</td>'+
        '</tr>'+
        '<tr>'+
            '<td>Image</td>'+
            '<td>Landmark Name</td>'+
            '<td>Lat</td>'+
            '<td>Lng</td>'+
            '<td>Lng</td>'+
        '</tr>'+
    '</table>';
}
$(document).ready(function() {
  var table = $('#datatables').DataTable({
    "pagingType": "full_numbers",
    "lengthMenu": [
      [10, 25, 50, -1],
      [10, 25, 50, "All"]
    ],
    responsive: true,
    order: [0, "desc"],
    language: {
      search: "_INPUT_",
      searchPlaceholder: "Search records",
    }
  });


  // Edit record
  table.on('click', '.edit', function() {
    $tr = $(this).closest('tr');
    var data = table.row($tr).data();
    alert('You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.');
  });

  // Delete a record
  table.on('click', '.remove', function(e) {
    $tr = $(this).closest('tr');
    table.row($tr).remove().draw();
    e.preventDefault();
  });

  //Like record
  table.on('click', '.like', function() {
    alert('You clicked on Like button');
  });
  
  
  
  
  $('#datatables tbody').on('click', 'td.details-control', function () {
          var tr = $(this).closest('tr');
          var row = table.row( tr );
 
          if ( row.child.isShown() ) {
              // This row is already open - close it
              row.child.hide();
              tr.removeClass('shown');
          }
          else {
              // Open this row
            console.log(row.data);
              row.child( format(row.data()) ).show();
              tr.addClass('shown');
          }
      } );
});
document.addEventListener('DOMContentLoaded', () => {
     const tables = document.querySelectorAll('table');

     tables.forEach(table => {
         table.addEventListener('click', (event) => {
             const target = event.target;
             if (target.tagName === 'TD' && target.contentEditable !== 'true') {
                 target.contentEditable = 'true';
                 target.focus();
             }
         });

         table.addEventListener('blur', (event) => {
             const target = event.target;
             if (target.tagName === 'TD') {
                 target.contentEditable = 'false';
             }
         }, true);
     });
 });

 function addRow(tableId) {
     const table = document.getElementById(tableId).getElementsByTagName('tbody')[0];
     const newRow = table.insertRow();

     const cellsCount = table.rows[0].cells.length;

     for (let i = 0; i < cellsCount; i++) {
         const newCell = newRow.insertCell(i);
         newCell.innerHTML = '';
     }
 }
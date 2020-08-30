<html>
<head>
<script>
$(function () {
    // Initialize appendGrid
    $('#tblAppendGrid').appendGrid({
        caption: 'My CD Collections',
        initRows: 1,
        columns: [
                { name: 'Album', display: 'Album', type: 'text', ctrlAttr: { maxlength: 100 }, ctrlCss: { width: '160px'} },
                { name: 'Artist', display: 'Artist', type: 'text', ctrlAttr: { maxlength: 100 }, ctrlCss: { width: '100px'} },
                { name: 'Year', display: 'Year', type: 'text', ctrlAttr: { maxlength: 4 }, ctrlCss: { width: '40px'} },
                { name: 'Origin', display: 'Origin', type: 'select', ctrlOptions: { 0: '{Choose}', 1: 'Hong Kong', 2: 'Taiwan', 3: 'Japan', 4: 'Korea', 5: 'US', 6: 'Others'} },
                { name: 'Poster', display: 'With Poster?', type: 'checkbox' },
                { name: 'Price', display: 'Price', type: 'text', ctrlAttr: { maxlength: 10 }, ctrlCss: { width: '50px', 'text-align': 'right' }, value: 0 },
                { name: 'RecordId', type: 'hidden', value: 0 }
            ]
    });
    // Handle `Load` button click
    $('#btnLoad').button().click(function () {
        $('#tblAppendGrid').appendGrid('load', [
            { 'Album': 'Dearest', 'Artist': 'Theresa Fu', 'Year': '2009', 'Origin': 1, 'Poster': true, 'Price': 168.9, 'RecordId': 123 },
            { 'Album': 'To be Free', 'Artist': 'Arashi', 'Year': '2010', 'Origin': 3, 'Poster': true, 'Price': 152.6, 'RecordId': 125 },
            { 'Album': 'Count On Me', 'Artist': 'Show Luo', 'Year': '2012', 'Origin': 2, 'Poster': false, 'Price': 306.8, 'RecordId': 127 },
            { 'Album': 'Wonder Party', 'Artist': 'Wonder Girls', 'Year': '2012', 'Origin': 4, 'Poster': true, 'Price': 108.6, 'RecordId': 129 },
            { 'Album': 'Reflection', 'Artist': 'Kelly Chen', 'Year': '2013', 'Origin': 1, 'Poster': false, 'Price': 138.2, 'RecordId': 131 }
        ]);
    });
    // Handle `Serialize` button click
    $('#btnSerialize').button().click(function () {
        alert('Here is the serialized data!!\n' + $(document.forms[0]).serialize());
    });
});
</script>


<link href="jquery-ui-1.10.2.css" rel="stylesheet"/>
<link href="jquery.appendGrid-x.x.x.css" rel="stylesheet"/>
<script type="text/javascript" src="jquery-1.9.1.js"></script>
<script type="text/javascript" src="jquery-ui-1.10.2.js"></script>
<script type="text/javascript" src="jquery.appendGrid-x.x.x.js"></script>
<script type="text/javascript">
    $(function () {
        $('#tblAppendGrid').appendGrid({ /* Initial parameters */ });
    });
</script>
</head>
<body>
    <table id="tblAppendGrid"></table>
</body>
</html>
</html>
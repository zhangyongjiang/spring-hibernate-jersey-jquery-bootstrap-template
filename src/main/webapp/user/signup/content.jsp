<h2>Sign Up</h2>

<form class="form-horizontal" role="form" onsubmit="return signup();">
  <div class="form-group">
    <label for="inputEmail" class="col-lg-2 control-label">Email</label>
    <div class="col-lg-10">
      <input type="email" class="form-control" id="inputEmail" placeholder="Email">
    </div>
  </div>

  <div class="form-group">
    <label for="inputFirstName" class="col-lg-2 control-label">First Name</label>
    <div class="col-lg-10">
      <input type="text" class="form-control" id="inputFirstName" placeholder="First Name">
    </div>
  </div>

  <div class="form-group">
    <label for="inputLastName" class="col-lg-2 control-label">Last Name</label>
    <div class="col-lg-10">
      <input type="text" class="form-control" id="inputLastName" placeholder="Last Name">
    </div>
  </div>

  <div class="form-group">
    <label for="inputPassword1" class="col-lg-2 control-label">Password</label>
    <div class="col-lg-10">
      <input type="password" class="form-control" id="inputPassword1" placeholder="Password">
    </div>
  </div>

  <div class="form-group">
    <div class="col-lg-offset-2 col-lg-10">
      <button type="submit" class="btn btn-default">Sign up</button>
    </div>
  </div>
</form>

<script type="text/javascript">
function signup() {
	var id = $("#inputEmail").val();
	var password = $("#inputPassword1").val();
	
	var req = {
		id: id,
		password:password,
		firstName:$('#inputFirstName').val(),
		lastName:$('#inputLastName').val(),
	};
	var json = JSON.stringify(req);
	var url = serverBase + "/ws/user/signup";
	$.ajax({
		  url: url,
		  type:"POST",
		  data:json,
		  contentType:"application/json; charset=utf-8",
		  dataType:"json",
		  complete: function(transport) {
			     if(transport.status == 200) {
			         self.location = serverBase + '/user/signin/index.jsp.oo';
			     } else {
			         alert('Error: ' + transport.responseText);
			     }
			  }
		});

	return false;
}
</script>

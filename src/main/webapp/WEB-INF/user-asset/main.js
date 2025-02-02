$("#employee").click(function(){
    $(".employee-list").toggleClass("d-none");
    $("#employee").toggleClass("bold-text");
  });
  $("#product").click(function(){
    $(".product-list").toggleClass("d-none");
    $("#product").toggleClass("bold-text");
  });
  $("#voucher").click(function(){
    $(".voucher-list").toggleClass("d-none");
    $("#voucher").toggleClass("bold-text");
  });
  $("#order").click(function(){
    $(".order-list").toggleClass("d-none");
    $("#order").toggleClass("bold-text");
  });
  
  $("#avatar").click(function(){
    $(".profile-dropdown").toggleClass("d-none");
  });
  

  // Lấy modal
  var modal = document.getElementById("deleteModal");

  // Lấy nút mở modal
  var deleteButtons = document.getElementsByClassName("deleteBtn");

  // Lấy phần <span> đóng modal
  var span = document.getElementsByClassName("close")[0];

  // Lấy các nút cancel và submit
  var cancelBtn = document.getElementsByClassName("modalCancel")[0];
  var submitBtn = document.getElementsByClassName("modalSubmit")[0];

  // Khi người dùng nhấp vào nút, mở modal
  for (var i = 0; i < deleteButtons.length; i++) {
    deleteButtons[i].onclick = function() {
        modal.style.display = "block";
        // Lưu trữ nút delete hiện tại để sử dụng sau
        var currentButton = this;

        // Khi người dùng nhấp vào nút submit, thực hiện hành động xóa sản phẩm
        submitBtn.onclick = function() {
            // Thực hiện hành động xóa sản phẩm tại đây
            alert("Object has been deleted.");
            modal.style.display = "none";
        }

        cancelBtn.onclick = function() {
          modal.style.display = "none";
        }
    }
}

  // Khi người dùng nhấp vào <span> (x), đóng modal
  span.onclick = function() {
      modal.style.display = "none";
  }


  // Khi người dùng nhấp vào bất cứ đâu bên ngoài modal, đóng modal
  window.onclick = function(event) {
      if (event.target == modal) {
          modal.style.display = "none";
      }
  }



// Lấy modal
var modal = document.getElementById("addModal");

// Lấy nút mở modal
var submitAddBtn = document.getElementById("submitAddBtn");

// Lấy phần <span> đóng modal
var span = document.getElementsByClassName("close")[0];

// Lấy các nút cancel và submit
var cancelBtn = document.getElementsByClassName("modalCancel")[0];
var submitBtn = document.getElementsByClassName("modalSubmit")[0];

// Khi người dùng nhấp vào nút, mở modal

  submitAddBtn.onclick = function() {
      modal.style.display = "block";
      // Lưu trữ nút delete hiện tại để sử dụng sau
      var currentButton = this;

      // Khi người dùng nhấp vào nút submit, thực hiện hành động xóa sản phẩm
      submitBtn.onclick = function() {
          // Thực hiện hành động xóa sản phẩm tại đây
          alert("Object has been added.");
          modal.style.display = "none";
      }

      cancelBtn.onclick = function() {
        modal.style.display = "none";
      }
  }


// Khi người dùng nhấp vào <span> (x), đóng modal
span.onclick = function() {
    modal.style.display = "none";
}


// Khi người dùng nhấp vào bất cứ đâu bên ngoài modal, đóng modal
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

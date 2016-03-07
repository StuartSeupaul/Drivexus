// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('ready page:load', function () {
  // $('#new_attached').submit(function (e) {
  //   e.preventDefault();
  //
  //   $.ajax({
  //     url: $(this).attr('action'),
  //     method:'POST',
  //     data: $(this).serialize(),
  //     dataType: 'json',
  //     success: function (data) {
  //       if (data) {
  //         $('.attached-question-class').append(data);
  //       }
  //     },
  //     error: function () {
  //       console.log("Errors!");
  //     }
  //   });
  // });

  $('.question-class').click(function () {
    var questionID = parseInt($(this).attr('data-qid'));
    $('#attached_question_id').val(questionID);
    $('#new_attached').trigger('submit');
  });

  $('#new_scantron').submit(function (e) {
    e.preventDefault();

    $('#new_answer').each(function () {
      console.log($(this));
    });
  });

});

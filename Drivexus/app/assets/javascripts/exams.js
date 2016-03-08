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
    var questionID = parseInt($(this).attr('data-qid'));   // get value of the answer (1 = true, 0 = false) from the form
    $('#attached_question_id').val(questionID);            // put the value in the corresponding field
    $('#new_attached').trigger('submit');                  // submit the form
  });

  $('.choicecontainernormal').click(function () {
    $(this).toggleClass('choicecontainerclicked');
  });

  $('.choicecontainerclicked').click(function () {
    $(this).toggleClass('choicecontainernormal');
  });

  // needs scantron_id, user_id, correct
  $('#testsubmitbutton').click(function () {
    console.log("working")
    var score = 0;
    $('#new_answer input[type=checkbox]').each(function() {
      var studentAnswer = $(this).is(':checked');                 // checks if the box is checked
      var correctAnswer = parseInt($(this).attr('data-spoon'));   // gather the correct answer
      if ((studentAnswer === true) && (correctAnswer === 1))      // sees if the user selected the correct answer
      {
        idName = '#' + $(this).attr('data-qnum');
        $(idName).val(true);
        score++;
      }
    });

    alert(score);
    $('.realanswerform').each(function() {
      $(this).trigger('submit');
    });
  });

});

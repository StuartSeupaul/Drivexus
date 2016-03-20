// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('ready page:load', function () {

  $('.flipq').click(function () {
    $(this).toggleClass('questions-showing');
    $('.list-of-questions').toggleClass('list-showing');
  });

  $('.question-class').click(function () {
    console.log($(this));
    var questionID = parseInt($(this).attr('data-qid'));   // get value of the answer (1 = true, 0 = false) from the form
    $('#attached_question_id').val(questionID);            // put the value in the corresponding field
    $('#new_attached').trigger('submit');                  // submit the form
  });

  $('.choicecontainer').click(function () {
    $(this).toggleClass('is-clicked');  // turns choice purple if clicked
  });

  // needs scantron_id, user_id, correct
  $('#testsubmitbutton').click(function () {
    gradeForTest = 0.0;
    totalQuestions = 0;
    correctAnswers = 0;
    $('.is-clicked').each(function() {
      totalQuestions++;
      self = $(this);

      // fills in the choice_id field for answer
      self.parent().find('.realanswerchoice').val(self.attr('data-cnum'));
      if(self.attr('data-spoon') == 1) {
        correctAnswers++;
        // changes color of div to green and records the answer as correct in the answer object
        $(this).toggleClass('is-correct');
        $(this).parent().find('.realanswercorrect').val(true);
      } else {
        $(this).toggleClass('is-incorrect');
        // if incorrect, sees which sibling was correct and makes it green
        $(this).parent().find('.choicecontainer').each(function () {
          if ($(this).attr('data-spoon') == 1) {
            $(this).toggleClass('is-correct');
          }
        });
      }
    });
    gradeForTest = correctAnswers/totalQuestions;

    // submits each answer to be saved
    $('.realanswerform').each(function() {
      $(this).trigger('submit');
    });

    scanid = parseInt($('#scantronid').html());
    urlfull = '/scantrons/' + scanid

    // updates the grade field on the scantron
    $.ajax({
      url: urlfull,
      method: 'put',
      data: {scantron:{result: gradeForTest}},
      dataType: 'script'
    });

    // hides the submit button once it has been clicked
    $('#testsubmitbutton').css('display', 'none');

  });

});

// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('ready page:load', function () {


  $('.question-class').click(function () {
    var questionID = parseInt($(this).attr('data-qid'));   // get value of the answer (1 = true, 0 = false) from the form
    $('#attached_question_id').val(questionID);            // put the value in the corresponding field
    $('#new_attached').trigger('submit');                  // submit the form
  });

  $('.choicecontainer').click(function () {
    // console.log($(this).closest('#questioncontent');
    $(this).toggleClass('is-clicked');
  });

  // needs scantron_id, user_id, correct
  $('#testsubmitbutton').click(function () {

    $('.is-clicked').each(function() {
      self = $(this);
      if(self.attr('data-spoon') == 1) {
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

    // submits each answer to be saved
    $('.realanswerform').each(function() {
      $(this).trigger('submit');
    });

    scanid = parseInt($('#scantronid').html());
    urlfull = '/scantrons/' + scanid

    $.ajax({
      url: urlfull,
      method: 'put',
      data: {scantron:{completed:true}},
      dataType: 'script'
    });

    $('#testsubmitbutton').css('display', 'none');

    
  });

});

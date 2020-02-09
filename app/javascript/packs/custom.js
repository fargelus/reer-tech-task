$(() => {
  $('[data-toggle="tooltip"]').tooltip();

  function copyUrl() {
    let timerId;
    const TIMER_VAL = 2000;

    $('.js-copy-url').click(ev => {
      const $self = $(ev.currentTarget);
      if (timerId) clearTimeout(timerId);
      onCopyUrlClicked($self);
      timerId = setTimeout(() => {
        rmCopyUrlAnimation($self);
      }, TIMER_VAL);
    });

    const urlAnimationClasses = 'animated bounceIn';
    const onCopyUrlClicked = $urlEl => {
      updateTooltipText($urlEl);
      const url = $urlEl.attr('data-copy-url');
      copyToClipboard(url);
      $urlEl.addClass(urlAnimationClasses);
    }

    const updateTooltipText = $urlEl => {
      const revertTitle = $urlEl.attr('data-revert-title');
      const origTitle = $urlEl.attr('data-original-title');
      $urlEl.attr({
        'data-original-title': revertTitle,
        'data-revert-title': origTitle
      });
    };

    const copyToClipboard = url => {
      const $textarea = $('<textarea>');
      $textarea.text(url)
               .hide()
               .appendTo('body')
               .select();
      document.execCommand('copy');
    }

    const rmCopyUrlAnimation = $urlEl => {
      $urlEl.removeClass(urlAnimationClasses);
      updateTooltipText($urlEl);
      $('.tooltip-inner').html( $urlEl.attr('data-original-title') );
    }
  }

  copyUrl();
});

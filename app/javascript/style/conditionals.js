// Example use : https://gist.github.com/benbonnet/799a4a0e3cf4fb26184b053d2faffc96

const Conditionals = {
  init() {
    const $conditionals = $("code").data("conditionals");
    if ($conditionals) {
      this.addEvents($conditionals);
    }
  },

  addEvents($conditionals) {
    $conditionals.forEach(conditional => {
      conditional.when.forEach(effect => {
        $(conditional.selector).on(effect.event, () => {
          effect.actions.forEach(action => {
            const $selector = $(action.nodes.join(", ")).not(
              action.excludes ? action.excludes.join(", ") : null
            );
            switch (action.type) {
              case "SHOW":
                $selector.show();
                break;
              case "HIDE":
                $selector.hide();
                this.resetInputs($selector);
                break;
              case "DISABLE":
                $selector.attr('disabled', true);
                break;
              case "ENABLE":
                $selector.removeAttr('disabled');
                break;
              case "RESET":
                this.resetInput($selector);
                break;
              default:
                break;
            }
          });
        });
      });
    });
  },

  resetInput($selector) {
    $selector.val('');
  },

  resetInputs($selector) {
    $selector
      .find("input")
      .val("")
      .removeAttr("selected")
      .removeAttr("checked");
    $selector.find("textarea").val("");
    $selector.find(".btn").removeClass("active");
  }
};

export { Conditionals };
require_relative 'base_page'

class Support < BasePage

  def assert_text(text)
    expect(content_box_text).to eq(text)
  end

  def content_box_text
    content_box.text
  end

  def click_nexia_link
    wait_for_modal_background
    nexia_link.click
  end

  def expect_select_list_text(text)
    expect(select_list.text).to include(text)
  end

  private

  # [Element:] Content Box
  # [HTML:] <div class="content-box">
  def content_box # :doc:
  	@browser.div(:class => "content-box")
  end

  # [Element:] Nexia Link
  # [HTML:] <a href="http://www.nexiahome.com" target="_blank">nexiahome.com</a>
  def nexia_link # :doc:
    content_box.a(:text => "nexiahome.com")
  end

  # [Element:] Select List
  # [HTML:] <div class="select-list">
  def select_list
    @browser.div(:class => "select-list")
  end

  # [Element:] Select List Option
  # [HTML:] <a class="select-list-option"></a>
  def select_list_option
    select_list.a(:class => "select-list-option")
  end

  # [Element:] Select List Option Label
  # [HTML:] <span class="select-list-option-label">
  def select_list_option_label
    select_list.span(:class => "select-list-option-label")
  end

  # [Element:] Call Suport Link
  # [HTML:] <a name="call-support" class="select-list-option" href="tel:8772887707">
  def call_support_link
    select_list.a(:name => "call-support")
    # text: Call Support (877) 288-7707
  end

  # [Element:] Email Support Link
  # [HTML:] <a name="email-support" class="select-list-option" href="mailto:Nexia_Technical_Support@irco.com?Subject=Nexia%20Support%20Question">
  def email_support_link
    select_list.a(:name => "email-support")
    # text: Email Support
  end

  # [Element:] Email Feedback Link
  # [HTML:] <a name="email-feedback" class="select-list-option" href="mailto:nexiamobile_betafeedback@irco.com?Subject=Nexia%20Mobile%20Feedback%2010610">
  def email_feedback_link
    select_list.a(:name => "email-feedback")
    # text: Send Suggestions/Feedback
  end

end # Support
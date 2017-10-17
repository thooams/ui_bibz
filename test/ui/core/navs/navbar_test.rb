require 'test_helper'
class NavbarTest < ActionView::TestCase

  test 'Navbar' do
    actual = UiBibz::Ui::Core::Navs::Navbar.new.tap do |nb|
    end
    expected = "<nav class=\"navbar navbar-light navbar-expand-lg\"><button class=\"navbar-toggler hidden-sm-up\" type=\"button\" data-toggle=\"collapse\" data-target=\"##{ actual.id }\">☰</button><div class=\"collapse navbar-collapse\" id=\"#{ actual.id }\"></div></nav>"

    assert_equal expected, actual.render
  end

  test 'Navbar with options' do
    actual = UiBibz::Ui::Core::Navs::Navbar.new(title: 'Brand', expand_size: :xs, status: :primary, position: :top, brand_position: :right).tap do |nb|
    end
    expected = "<nav class=\"bg-primary navbar navbar-light fixed-top navbar-expand-xs\"><button class=\"navbar-toggler hidden-sm-up\" type=\"button\" data-toggle=\"collapse\" data-target=\"##{ actual.id }\">☰</button><a class=\"navbar-brand\" href=\"/\">Brand</a><div class=\"collapse navbar-collapse\" id=\"#{ actual.id }\"></div></nav>"

    assert_equal expected, actual.render
  end

  test 'Navbar with brand, nav, form and text' do
    actual = UiBibz::Ui::Core::Navs::Navbar.new.tap do |nb|
      nb.brand "Brand"
      nb.nav do |n|
        n.link 'Home', state: :active, url: "#Home", selector: 'home'
        n.link 'Profile', url: "#profile", selector: 'profile'
        n.link 'Messages', url: "#messages", selector: 'messages'
      end
      nb.form "#", { type: :form_tag, position: :right } do
        UiBibz::Ui::Core::Forms::Texts::TextField.new('search').render
        UiBibz::Ui::Core::Forms::Buttons::Button.new('Search').render
      end
      nb.text 'test'
    end
    expected = "<nav class=\"navbar navbar-light navbar-expand-lg\"><a class=\"navbar-brand\" href=\"/\">Brand</a><button class=\"navbar-toggler hidden-sm-up\" type=\"button\" data-toggle=\"collapse\" data-target=\"##{ actual.id }\">☰</button><div class=\"collapse navbar-collapse\" id=\"#{ actual.id }\"><ul class=\"navbar-nav mr-auto\"><li class=\"nav-item\"><a class=\"active nav-link\" href=\"#Home\">Home</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"#profile\">Profile</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"#messages\">Messages</a></li></ul><form type=\"form_tag\" position=\"right\" class=\"navbar-form form-inline pull-right\" action=\"#\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><button class=\"btn-primary btn\">Search</button></form><span class=\"navbar-text\">test</span></div></nav>"

    assert_equal expected, actual.render
  end

end

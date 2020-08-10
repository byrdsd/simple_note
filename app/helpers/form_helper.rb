module FormHelper
  def form_field
    tag.div class: "sn-FormField" do
      yield
    end
  end
end

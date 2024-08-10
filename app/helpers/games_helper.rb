# frozen_string_literal: true

module GamesHelper
  def command(text, command: nil, direct:, indirect: nil)
    parens = command.blank?
    command = text if command.blank?
    type = "Command::#{ command.capitalize }"
    text = parens ? "(#{ text })" : text
    form_with url: game_path, method: :patch, class: "inline" do |f|
      [
        f.hidden_field(:direct_id, value: direct.id),
        f.hidden_field(:direct_type, value: direct.class.name),
        f.hidden_field(:type, value: type),
        f.submit(text, class: "link")
      ].join.html_safe
    end
  end
end

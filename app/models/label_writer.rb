module LabelWriter

  def generate_labels(filepath, labels)
    Prawn::Document.generate(filepath, page_size: 'A4') do
      fontpath = 'vendor/prawn'
      font_families.update(
                       "DejaVu Sans" => {
                           normal: "#{fontpath}/DejaVuSans.ttf",
                           bold: "#{fontpath}/DejaVuSans-Bold.ttf"
                       }
      )
      font('DejaVu Sans')
      font_size 8
      col = 0
      y_position = cursor
      labels.each do |label|
        x_position = col * 280
        bounding_box([x_position, y_position], width: 265) do
          pad_bottom(5){ text 'SIL Cameroon Archives', style: :bold }
          text "#{label[:authors]} #{label[:year]}"
          text label[:title1]
          text label[:title2]
          pad_top(5){ text "Archive: #{label[:number]}", style: :bold }
        end
        col = (col + 1) % 2
        y_position += -90 if col == 0
        if y_position < 80
          start_new_page
          y_position = cursor
        end
      end

    end
  end

end
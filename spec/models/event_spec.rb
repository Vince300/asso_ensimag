describe Event do
  it "is valid with a name, start_time before end_time, location, description, facebook_url and asso" do
    event = build(:event)

    expect(event).to be_valid
  end

  it "is invalid without a name" do
    event = build(:event, name: nil)
    event.valid?

    expect(event.errors[:name]).to include(I18n.t('errors.messages.blank'))
  end

  it "is invalid without a start_time" do
    event = build(:event, start_time: nil)
    event.valid?

    expect(event.errors[:start_time]).to include(I18n.t('errors.messages.not_a_date'))
  end

  it "is invalid without an end_time" do
    event = build(:event, end_time: nil)
    event.valid?

    expect(event.errors[:end_time]).to include(I18n.t('errors.messages.not_a_date'))
  end

  it "is invalid if it ends before it starts" do
    dt = DateTime.now
    event = build(:event, start_time: dt.to_formatted_s(:db),
                          end_time: (dt - 2.hours).to_formatted_s(:db))
    event.valid?

    expect(event.errors[:end_time]).to include(I18n.t('errors.messages.after', date: I18n.localize(dt)))
  end

  it "is invalid without a location" do
    event = build(:event, location: nil)
    event.valid?

    expect(event.errors[:location]).to include(I18n.t('errors.messages.blank'))
  end

  it "is invalid without a description" do
    event = build(:event, description: nil)
    event.valid?

    expect(event.errors[:description]).to include(I18n.t('errors.messages.blank'))
  end

  it "is valid without a facebook_url" do
    event = build(:event, facebook_url: nil)

    expect(event).to be_valid
  end

  it "is invalid with an invalid facebook_url" do
    event = build(:event, facebook_url: "potato")
    event.valid?

    expect(event.errors[:facebook_url]).to include(I18n.t('errors.messages.url'))
  end

  it "is invalid without an asso" do
    event = build(:event, asso: nil)
    event.valid?

    expect(event.errors[:asso]).to include(I18n.t('errors.messages.blank'))
  end
end
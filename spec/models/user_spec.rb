describe User do
  it "is valid with an email, username, description, and color" do
    user = build(:user)

    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = build(:user, email: nil)
    user.valid?

    expect(user.errors[:email]).to include(I18n.t('errors.messages.blank'))
  end

  it "is invalid without a valid email" do
    user = build(:user, email: "potato")
    user.valid?

    expect(user.errors[:email]).to include(I18n.t('errors.messages.invalid'))
  end

  it "is invalid without a username" do
    user = build(:user, username: nil)
    user.valid?

    expect(user.errors[:username]).to include(I18n.t('errors.messages.blank'))
  end

  it "is invalid without a description" do
    user = build(:user, description: nil)
    user.valid?

    expect(user.errors[:description]).to include(I18n.t('errors.messages.blank'))
  end

  it "is invalid without a color" do
    user = build(:user, color: nil)
    user.valid?

    expect(user.errors[:color]).to include(I18n.t('errors.messages.blank'))
  end

  it "is invalid without a valid color" do
    user = build(:user, color: "potato")
    user.valid?

    expect(user.errors[:color]).to include(I18n.t('errors.messages.color'))
  end

  it "is invalid with a duplicate order" do
    create(:user, order: 1)
    user = build(:user, order: 1)
    user.valid?

    expect(user.errors[:order]).to include(I18n.t('errors.messages.exclusion'))
  end

  it "is valid without a site url" do
    user = build(:user, site_url: nil)

    expect(user).to be_valid
  end

  it "is valid with a blank site url" do
    user = build(:user, site_url: "")

    expect(user).to be_valid
  end

  it "is invalid with an invalid site url" do
    user = build(:user, site_url: "potato")
    user.valid?

    expect(user.errors[:site_url]).to include(I18n.t('errors.messages.url'))
  end

  it "is valid without a facebook url" do
    user = build(:user, facebook_url: nil)

    expect(user).to be_valid
  end

  it "is valid with a blank facebook url" do
    user = build(:user, facebook_url: "")

    expect(user).to be_valid
  end

  it "is invalid with an invalid facebook url" do
    user = build(:user, facebook_url: "potato")
    user.valid?

    expect(user.errors[:facebook_url]).to include(I18n.t('errors.messages.url'))
  end
end
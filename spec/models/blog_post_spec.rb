describe BlogPost do
  it "is valid with a title, summary, published date, body and author" do
    post = build(:blog_post)

    expect(post).to be_valid
  end

  it "is invalid without a title" do
    post = build(:blog_post, title: nil)
    post.valid?

    expect(post.errors[:title]).to include(I18n.t('errors.messages.blank'))
  end

  it "is invalid without a summary" do
    post = build(:blog_post, summary: nil)
    post.valid?

    expect(post.errors[:summary]).to include(I18n.t('errors.messages.blank'))
  end

  # Note: invalid dates are considered nil, so one test is enough for this attribute
  it "is invalid without a published date" do
    post = build(:blog_post, published: nil)
    post.valid?

    expect(post.errors[:published]).to include(I18n.t('errors.messages.not_a_date'))
  end

  it "is invalid without a body" do
    post = build(:blog_post, body: nil)
    post.valid?

    expect(post.errors[:body]).to include(I18n.t('errors.messages.blank'))
  end

  it "is invalid without an author" do
    post = build(:blog_post, author: nil)
    post.valid?

    expect(post.errors[:author]).to include(I18n.t('errors.messages.blank'))
  end
end
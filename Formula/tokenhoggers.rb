class Tokenhoggers < Formula
  include Language::Python::Virtualenv

  desc "Track your AI usage across Claude Code, Cursor, Gemini, and more"
  homepage "https://tokenhoggers.ai"
  url "https://files.pythonhosted.org/packages/source/t/tokenhoggers/tokenhoggers-0.1.1.tar.gz"
  sha256 "a636658750949d97ca9369f1ba29d6dfca125e31cb081730261457d8bd762d42"
  license "MIT"

  depends_on "python@3.12"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/25/ee/6caf7a40c36a1220410afe15a1cc64993a1f864871f698c0f93acb72842a/certifi-2026.4.22.tar.gz"
    sha256 "8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580"
  end

  def install
    virtualenv_install_with_resources
  end

  def post_install
    ohai "Token Hoggers installed!"
    ohai "Run 'tokenhoggers login' to sign in and enable auto-sync."
  end

  test do
    assert_match "Token Hoggers", shell_output("#{bin}/tokenhoggers --help")
  end
end

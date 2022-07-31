module HelperExpectations
  def hash_list_given
    {
      "/url_2/1" => 4,
      "/url_3" => 2,
      "/url_2" => 5,
      "/url_1" => 3
    }
  end

  def hash_list_expected
    {
      "/url_3" => 2,
      "/url_1" => 3,
      "/url_2/1" => 4,
      "/url_2" => 5
    }
  end

  def correct_log_list_given
    [
      "/about/2 543.910.244.929",
      "/help_page/1 200.017.277.774",
      "/home 126.318.035.038",
      "/about/2 184.123.665.067",
      "/home 451.106.204.921",
      "/home 200.017.277.774",
      "/about/2 200.017.277.774",
      "/about 543.910.244.929"
    ]
  end

  def correct_log_list_expected
    {
      "/about/2" => 3,
      "/home" => 3,
      "/help_page/1" => 1,
      "/about" => 1
    }
  end

  def log_list_with_bad_rows_given
    [
      "/about/2543.910.244.929",
      "/help_page/1 200.017.277.774",
      "/home BAD_IP",
      "/about/2 184.123.665.067",
      "home// 451.106.204.921",
      "/home 200.017.277.774",
      "/about/2 200.017.277.774"
    ]
  end

  def omitted_log_list_expected
    {
      "/about/2" => 2,
      "/help_page/1" => 1,
      "/home" => 1
    }
  end

  def correct_log_list_given_non_unique
    [
      "/about/2 543.910.244.929",
      "/help_page/1 200.017.277.774",
      "/home 126.318.035.038",
      "/about/2 184.123.665.067",
      "/home/1 451.106.204.921",
      "/home 200.817.217.774",
      "/help_page 300.027.279.774",
      "/home/2 200.017.277.774",
      "/about/2 200.117.237.774",
      "/about 543.910.244.929"
    ]
  end

  def log_list_with_bad_rows_given_non_unique
    [
      "about/2 543.910.244.929",
      "/help_page/1 XYZ.017.277.774",
      "/home 126.318.035.038",
      "/about/2 184.123.665.067",
      "/home/1451.106.204.921",
      "/home 200.817.217.774",
      "/help_page 300.027.279.774",
      "/home/2 200.017.277.774",
      "/about/2 200.117.237.774",
      "/about 543.910.244.929"
    ]
  end

  def correct_log_list_expected_non_unique
    {
      "/about" => 4,
      "/home" => 4,
      "/help_page" => 2
    }
  end

  def correct_log_list_with_omitted_expected_non_unique
    {
      "/about" => 3,
      "/home" => 3,
      "/help_page" => 1
    }
  end
end

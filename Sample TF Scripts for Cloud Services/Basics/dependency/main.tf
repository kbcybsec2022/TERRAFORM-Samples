resource local_file name1 {
  content = "This is random string from RP : ${random_string.name2.id}"
  filename             = "explicit.txt"
  depends_on = [random_string.name2]
}

resource random_string name2 {
    length = 10
}
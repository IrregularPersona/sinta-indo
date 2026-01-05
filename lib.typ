// SINTA-1 Spec
#let sinta-1(

  // Set journal specification
  journal-title: [Journal Title: Institution Name],
  print-issn: [1234-5678],
  electronic-issn: [1234-5678],
  vol-num: none,
  issue-num: none,
  publish-date: [January 20xx],
  doi: none,

  // Set paper title.
  indonesian-title: [Indonesian Title], // Note: 12pt Bold Capital

  // Set paper authors.
  /*
    The shape of the author struct would be something like:
    author = (
      name,
      university = (
        uni-name,
        uni-major
      ),
      organization,
      email,
    )
  */
  authors: (),

  // Abstract content and the keywords that follows.
  indonesian-abstract: none,                     // 12pt Bold
  english-abstract: none,                        // 12pt Bold
  abstract-keywords: (), // min 3, max 6 (no guide on sizing)

  paper-size: "a4",
  reference: none, // calls BiBLaTex references
  body
) = {

  // Set document title, and author
  set document(
    title: title,
    author: authors.map(author => author.name)
  )

  set paper(
    margin: (
      top: 2.25cm,
      bottom: 2.25cm,
      left: 2.5cm,
      right: 2cm,
    )
  )

  set text(
    font: "Times New Roman", 
    size: 12pt,
    spacing: 1.15em,
  )
}


#let create-img-fig(img) = {
  
}

#let create-table-fig(img) = {
  
}

#let sinta-1-fig(fig-type, fig) = {
  // check if the 2 args exists
  assert(fig-type in ("table", "image"), "Figure type has to be either a table or an image.")
  assert(fig != none, "You need to pass a figure into this.")

  if fig-type == "table" [
    assert(fig.func() != table, "You need to pass a table as the figure content.")
  ] else [
    assert(fig.func() != image, "You need to pass an image as the figure content.")
  ]
}

/* --- */

// SINTA-3
#let sinta-3(
  // tititle
  article-title: [Article Title Here],
  
  // abstract
  abstract: none,
  abstract-keywords: (),
  abstract-eng: none,
  abstract-keywords-eng: (),

  // BibLaTeX
  bibliography: none,
) = {

  set paper(
    size: "a4"
  )

  set text(
    font: "Times New Roman",
    size: 11pt,
    spacing: 1.5pt,
  )

  set numbering("A.")

  show heading.where(level: 2): {
    set text(
      size: 12pt,
    )
  }
}

#let sinta-3-fig(fig-struct) = {
  /*
    fig-struct = (
      container,
      caption,
    )
  */

  set text(lang: "id")
  show figure.caption: strong

  // basic checks
  assert.ne(fig-struct, none, message: "Fig structure cannot be empty")
  assert(fig-struct.children.at(0).func() in (image, table), message: "You need to pass in an image or a table into the content!")

  let fig-content = fig-struct.children.at(0)
  let fig-caption = fig-struct.children.at(1)

  return figure(
    fig-content,
    caption: figure.caption(
      position: top,
      separator: [. ],
      [#fig-caption]
    )
  )
}

#let foo = {
  table(
    columns: 3,
    ..range(9).map(x => [#x])
  )
}


#{
  context foo.func() in (image, table)
}

#let struct = {
  foo
  "Some caption"
}
#sinta-3-fig(struct)

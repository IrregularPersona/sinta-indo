// Based upon alot of the charged-ieee template.
// You'll see alot of similarities, aside from
// How the template itself is constructed.


#let sinta(
  // Set paper title.
  indonesian-title: [Indonesian Title],
  english-title: [English Title],
  
  // Set paper authors.
  /*
    The shape of the author struct would be something like:

    author = (
      Full name,
      Program,
      Faculty,
      Address,
      Country,
      Email,
    )
  */
  authors: (),

  // Abstract content and the keywords that follows.
  indonesian-abstract: none,
  english-abstract: none,
  abstract-keywords: (),

  paper-size: "a4",
  reference: none,
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

  // The heading numberings
  // E.g:
  // "1    Pendahuluan"
  // "2    Tinjauan"

  set heading(
    numbering: "1   ",
  )
  
}

// Foundation for figure supplemental
// E.g
// [Gambar n]
// [Tabel n]
#let fig-supp(fig-type, content) = {

}

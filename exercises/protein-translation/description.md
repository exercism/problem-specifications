# Description

Translate RNA sequences into proteins.

You can break an RNA strand into three-nucleotide sequences called codons and then translate them into amino acids to make a protein like so:

| RNA         | Three-letter codons | Amino acids                             |
| ----------- | ------------------- | --------------------------------------- |
| "AUGUUUUCU" | "AUG", "UUU", "UCU" | "Methionine", "Phenylalanine", "Serine" |

There are also three STOP codons. If you encounter any of these codons, ignore the rest of the sequence — the protein is complete. For example, UAA is a STOP codon, so ignore any subsequent codons:

| RNA               | Three-letter codons               | Amino acids                             |
| ----------------- | --------------------------------- | --------------------------------------- |
| "AUGUUUUCUUAAAUG" | "AUG", "UUU", "UCU", "UAA", "AUG" | "Methionine", "Phenylalanine", "Serine" |

(Note that the latter AUG is not translated into another methionine.)

Below are the codons and resulting amino acids needed for the exercise.

| Codon              | Amino Acid    |
| :----------------- | :------------ |
| AUG                | Methionine    |
| UUU, UUC           | Phenylalanine |
| UUA, UUG           | Leucine       |
| UCU, UCC, UCA, UCG | Serine        |
| UAU, UAC           | Tyrosine      |
| UGU, UGC           | Cysteine      |
| UGG                | Tryptophan    |
| UAA, UAG, UGA      | STOP          |

Learn more about [protein translation on Wikipedia][protein-translation].

[protein-translation]: https://en.wikipedia.org/wiki/Translation_(biology)

data BookInfo = Book Int String [String]
  deriving (Show)

data MagazingInfo = Magazine Int String [String]
  deriving (Show)

myInfo = Book 9780596520687 "Algebra of Programming" ["Richard Bird", "Oege de Moor"]

type CustomerID = Int

type ReviewBody = String

data BetterReview = BetterReview BookInfo CustomerID ReviewBody

data BookReview = BookReview BookInfo CustomerID String

type BookRecod = (BookInfo, BookReview)

--
type CardHolder = String

type CardNumber = String

type Address = [String]

data BillingIngo
  = CreditCard CardNumber CardHolder Address
  | CashOnDelivery
  | Invoice CustomerID
  deriving (Show)

-- Can pattern match on algebraic data types ussing its value constrocturs
bookId (Book id _ _) = id

bookTitle (Book _ title _) = title

bookAuthors (Book _ _ authors) = authors

-- Record Syntax
-- We can define a data type and accessors for its components in one go
data Customer = Customer
  { customerId :: CustomerID,
    customerName :: String,
    customerAddress :: Address
  }
  deriving (Show)

-- Can still use the application syntax to create a value of this type
customer1 = Customer 1 "Bob" ["lalaladdress"]

-- With record syntax: (note can change order of fields)
customer2 =
  Customer
    { customerId = 2,
      customerAddress = ["2nd address"],
      customerName = "Alice"
    }

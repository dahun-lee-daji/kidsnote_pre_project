//
//  BookSearchClient+PreviewValue.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/30/24.
//

import Foundation
import Dependencies

//extension BookSearchClient {
//    static var previewValue: BookSearchClient {
//        return .init { _ in
//            let json = """
//            {
//              "kind" : "books#volumes",
//              "totalItems" : 1698,
//              "items" : [
//                {
//                  "selfLink" : "https://www.googleapis.com/books/v1/volumes/hDlfCwAAQBAJ",
//                  "volumeInfo" : {
//                    "publisher" : "창비",
//                    "industryIdentifiers" : [
//                      {
//                        "type" : "ISBN_13",
//                        "identifier" : "9788936404796"
//                      },
//                      {
//                        "type" : "ISBN_10",
//                        "identifier" : "8936404792"
//                      }
//                    ],
//                    "title" : "철의 시대",
//                    "readingModes" : {
//                      "image" : true,
//                      "text" : true
//                    },
//                    "language" : "ko",
//                    "infoLink" : "https://play.google.com/store/books/details?id=hDlfCwAAQBAJ&source=gbs_api",
//                    "imageLinks" : {
//                      "thumbnail" : "http://books.google.com/books/content?id=hDlfCwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
//                      "smallThumbnail" : "http://books.google.com/books/content?id=hDlfCwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
//                    },
//                    "panelizationSummary" : {
//                      "containsImageBubbles" : false,
//                      "containsEpubBubbles" : false
//                    },
//                    "allowAnonLogging" : true,
//                    "printType" : "BOOK",
//                    "authors" : [
//                      "강창훈"
//                    ],
//                    "pageCount" : 248,
//                    "subtitle" : "철과 함께한 인류의 역사",
//                    "maturityRating" : "NOT_MATURE",
//                    "contentVersion" : "1.2.2.0.preview.3",
//                    "publishedDate" : "2015-12-16",
//                    "previewLink" : "http://books.google.co.kr/books?id=hDlfCwAAQBAJ&printsec=frontcover&dq=%EC%B2%A0&hl=&cd=1&source=gbs_api",
//                    "canonicalVolumeLink" : "https://play.google.com/store/books/details?id=hDlfCwAAQBAJ",
//                    "categories" : [
//                      "History"
//                    ],
//                    "description" : "고대 쇠도끼부터 최첨단 아이언맨까지, 철을 통해 들여다보는 단단한 세계사! 『멋지기 때문에 놀러 왔지』 『토요일의 심리 클럽』 『식탁 위의 세계사』 등을 잇는 제5회 창비청소년도서상 수상작 『철의 시대』가 출간되었다. 저자 강창훈은 삼천 년 넘게 계속되고 있는 철기 시대 동안 철과 인류가 어떤 영향을 주고받았는지 알아보기 위해 철을 중심으로 과거를 재구성하고 미래까지 고찰한다. 철의 탄생에 얽힌 과학적 지식으로 시작하여 철기 시대가 개막하고, 제철 기술이 혁신을 거듭하며 강철이 대량 생산되어 현대 문명을 일군 과정을 차근차근 살펴본다. 이를 통해 철이 역사를 움직인 중요한 원동력이었고, 그 바탕에는 더 나은 삶을 살고자 하는 인간의 욕망이 숨어 있었음을 역설하며 지식을 전달하는 데서 나아가 인간의 본성과 세계의 미래에 대해서도 고민해 보게끔 한다. 청소년의 눈높이에 맞춰 역사, 과학, 미술을 비롯한 다양한 분야의 정보를 서술하면서 80여 컷의 사진 자료 또한 수록하여 이해를 돕는다. 과학과 인문학의 만남, 새로운 세계사를 써 내다 최근 들어 미국 역사가 데이비드 크리스천이 주창한 ‘빅 히스토리’를 비롯해 세계사 교육에서 과학과 인문학을 접목하려는 시도가 주목받고 있다. 『철의 시대』 또한 역사를 이야기하기에 앞서 철의 기원과 성질을 물리학, 화학, 천문학을 끌어들여 살펴본다. 철이 산소와 결합하기 쉽다는 성질은 제철의 기초 원리로 이어지며, 지구 내부의 철 성분 때문에 지구 자기장이 만들어진다는 사실은 나침반의 원리를 이해하는 데 밑바탕이 된다. 이러한 과학 지식은 우수한 철제 무기를 앞세워 대제국을 건설한 몽골, 대양을 항해해 아메리카를 정복한 유럽인 등 역사적 사건과 자연스럽게 연결되며 철기 문명의 흐름을 좀 더 넓은 시점으로 바라볼 수 있도록 도와준다. 세계사는 시작부터 지금까지 계속 ‘철기 시대’였다 ‘철의 제국’ 히타이트, 유럽보다 천 년 앞섰던 송나라의 제철 기술, 산업 혁명의 원동력이 된 철도와 증기선 등 역사의 전환기에는 항상 철이 있었다. 작가 강창훈은 철의 발전 과정을 따라 지역과 시간대를 넘나들며 세계사를 새롭게 서술했다. 서아시아에서 처음 만들어진 철기가 세계 각지로 전파되고, 중국에서 기술이 발전되어 한나라와 몽골 같은 대제국이 건설되었으며, 중국보다 뒤처졌던 유럽이 중세 이후 급격히 기술을 발전시켜 산업 혁명을 선도하고 19세기 말과 20세기 초 전 세계를 석권했다. 철과 인류 문명이 주고받은 영향에 주목함으로써 이전과 다른 방식으로 세계사를 읽어 낸 것이다. 또한 터키에서 발견된 최초의 제련 흔적, 현대 기술로도 복원할 수 없는 인도의 강철 검, 시속 19킬로미터로 달리는 당대 가장 빠른 기관차 등 교과서에서 다루지 않던 내용까지 담아내어 흥미를 돋운다. 철의 빛과 그림자, 그리고 미래 『철의 시대』는 인간이 철로 이룩한 업적을 살피는 데 그치지 않고 철을 잘못 사용해 일어난 문제도 진단한다. 철이 오랫동안 널리 쓰였던 배경에는 끊임없이 강해지고자 하는 인간의 바람이 있었고 때로 욕망이 지나쳐 철을 파괴의 도구로 만들어 버렸다는 것이다. 특히 철을 생산하는 과정에서 벌어진 환경 오염과 지구 온난화는 현재 전 세계에서 심각한 문제로 대두되었다. 다행히 사람들은 해결책을 고심하고 있다. 제철소에서는 공해 물질을 줄이고 고철을 재활용하며, 과학자들은 철로 지구 온난화를 해소하고 화석 연료를 대체할 수 없을지 연구하고 있다. 『철의 시대』는 독자에게 과거와 현재를 객관적으로 알려 줌과 동시에 철을 어떻게 잘 활용하면 좋을지 고민해 보길 제안한다. Changbi Publishers"
//                  },
//                  "id" : "hDlfCwAAQBAJ",
//                  "saleInfo" : {
//                    "listPrice" : {
//                      "amount" : 7700,
//                      "currencyCode" : "KRW"
//                    },
//                    "offers" : [
//                      {
//                        "listPrice" : {
//                          "amountInMicros" : 7700000000,
//                          "currencyCode" : "KRW"
//                        },
//                        "retailPrice" : {
//                          "amountInMicros" : 6930000000,
//                          "currencyCode" : "KRW"
//                        },
//                        "finskyOfferType" : 1
//                      }
//                    ],
//                    "country" : "KR",
//                    "saleability" : "FOR_SALE",
//                    "retailPrice" : {
//                      "amount" : 6930,
//                      "currencyCode" : "KRW"
//                    },
//                    "isEbook" : true,
//                    "buyLink" : "https://play.google.com/store/books/details?id=hDlfCwAAQBAJ&rdid=book-hDlfCwAAQBAJ&rdot=1&source=gbs_api"
//                  },
//                  "accessInfo" : {
//                    "viewability" : "PARTIAL",
//                    "publicDomain" : false,
//                    "country" : "KR",
//                    "accessViewStatus" : "SAMPLE",
//                    "webReaderLink" : "http://play.google.com/books/reader?id=hDlfCwAAQBAJ&hl=&source=gbs_api",
//                    "quoteSharingAllowed" : false,
//                    "textToSpeechPermission" : "ALLOWED",
//                    "pdf" : {
//                      "isAvailable" : true,
//                      "acsTokenLink" : "http://books.google.co.kr/books/download/%EC%B2%A0%EC%9D%98_%EC%8B%9C%EB%8C%80-sample-pdf.acsm?id=hDlfCwAAQBAJ&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
//                    },
//                    "embeddable" : true,
//                    "epub" : {
//                      "isAvailable" : true,
//                      "acsTokenLink" : "http://books.google.co.kr/books/download/%EC%B2%A0%EC%9D%98_%EC%8B%9C%EB%8C%80-sample-epub.acsm?id=hDlfCwAAQBAJ&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
//                    }
//                  },
//                  "searchInfo" : {
//                    "textSnippet" : "고대 쇠도끼부터 최첨단 아이언맨까지, 철을 통해 들여다보는 단단한 세계사! 『멋지기 때문에 놀러 왔지』 『토요일의 심리 클럽』 『식탁 위의 세계사』 등을 잇는 제5회 ..."
//                  },
//                  "kind" : "books#volume",
//                  "etag" : "G4Jio6PTenY"
//                },
//                {
//                  "selfLink" : "https://www.googleapis.com/books/v1/volumes/t8REDwAAQBAJ",
//                  "volumeInfo" : {
//                    "description" : "\"철의 100가지 속성\" 이 책은 '철든다'에 대한 다양한 의미를 가지고 있는 책입니다. 어린이에게는 왜이렇게 철을 들지 않았니, 라고 하지만 막상 어른이 되면 철없는 아이를 원하는 누군가처럼 철이라는 단어 하나에도 다양한 마음이 담겨 있습니다. 이 책을 통해서 많은 분들이 생각하는 '철들다'라는 것의 의미는 무엇인지 느껴보세요.",
//                    "categories" : [
//                      "Business & Economics"
//                    ],
//                    "readingModes" : {
//                      "image" : true,
//                      "text" : false
//                    },
//                    "contentVersion" : "0.1.1.0.preview.1",
//                    "infoLink" : "https://play.google.com/store/books/details?id=t8REDwAAQBAJ&source=gbs_api",
//                    "canonicalVolumeLink" : "https://play.google.com/store/books/details?id=t8REDwAAQBAJ",
//                    "authors" : [
//                      "윤혜림 외 57명"
//                    ],
//                    "publishedDate" : "2017-12-22",
//                    "title" : "철의 100가지 속성",
//                    "publisher" : "쿰라이프게임즈",
//                    "industryIdentifiers" : [
//                      {
//                        "type" : "ISBN_13",
//                        "identifier" : "9791188430949"
//                      }
//                    ],
//                    "printType" : "BOOK",
//                    "maturityRating" : "MATURE",
//                    "pageCount" : 133,
//                    "allowAnonLogging" : false,
//                    "imageLinks" : {
//                      "thumbnail" : "http://books.google.com/books/content?id=t8REDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
//                      "smallThumbnail" : "http://books.google.com/books/content?id=t8REDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
//                    },
//                    "language" : "ko",
//                    "previewLink" : "http://books.google.co.kr/books?id=t8REDwAAQBAJ&printsec=frontcover&dq=%EC%B2%A0&hl=&cd=2&source=gbs_api",
//                    "panelizationSummary" : {
//                      "containsImageBubbles" : false,
//                      "containsEpubBubbles" : false
//                    }
//                  },
//                  "id" : "t8REDwAAQBAJ",
//                  "saleInfo" : {
//                    "listPrice" : {
//                      "amount" : 8000,
//                      "currencyCode" : "KRW"
//                    },
//                    "offers" : [
//                      {
//                        "listPrice" : {
//                          "amountInMicros" : 8000000000,
//                          "currencyCode" : "KRW"
//                        },
//                        "retailPrice" : {
//                          "amountInMicros" : 7200000000,
//                          "currencyCode" : "KRW"
//                        },
//                        "finskyOfferType" : 1
//                      }
//                    ],
//                    "country" : "KR",
//                    "saleability" : "FOR_SALE",
//                    "retailPrice" : {
//                      "amount" : 7200,
//                      "currencyCode" : "KRW"
//                    },
//                    "isEbook" : true,
//                    "buyLink" : "https://play.google.com/store/books/details?id=t8REDwAAQBAJ&rdid=book-t8REDwAAQBAJ&rdot=1&source=gbs_api"
//                  },
//                  "accessInfo" : {
//                    "viewability" : "PARTIAL",
//                    "publicDomain" : false,
//                    "country" : "KR",
//                    "accessViewStatus" : "SAMPLE",
//                    "webReaderLink" : "http://play.google.com/books/reader?id=t8REDwAAQBAJ&hl=&source=gbs_api",
//                    "quoteSharingAllowed" : false,
//                    "textToSpeechPermission" : "ALLOWED",
//                    "pdf" : {
//                      "isAvailable" : true,
//                      "acsTokenLink" : "http://books.google.co.kr/books/download/%EC%B2%A0%EC%9D%98_100%EA%B0%80%EC%A7%80_%EC%86%8D%EC%84%B1-sample-pdf.acsm?id=t8REDwAAQBAJ&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
//                    },
//                    "embeddable" : true,
//                    "epub" : {
//                      "isAvailable" : false
//                    }
//                  },
//                  "searchInfo" : {
//                    "textSnippet" : "&quot;철의 100가지 속성&quot; 이 책은 &#39;철든다&#39;에 대한 다양한 의미를 가지고 있는 책입니다. 어린이에게는 왜이렇게 철을 들지 않았니, 라고 하지만 막상 어른이 되면 철없는 아이를 원하는 ..."
//                  },
//                  "kind" : "books#volume",
//                  "etag" : "3fJ42QZtdD8"
//                },
//                {
//                  "selfLink" : "https://www.googleapis.com/books/v1/volumes/QdsiwAEACAAJ",
//                  "volumeInfo" : {
//                    "infoLink" : "http://books.google.co.kr/books?id=QdsiwAEACAAJ&dq=%EC%B2%A0&hl=&source=gbs_api",
//                    "contentVersion" : "preview-1.0.0",
//                    "readingModes" : {
//                      "image" : false,
//                      "text" : false
//                    },
//                    "subtitle" : "철의 문화사",
//                    "canonicalVolumeLink" : "https://books.google.com/books/about/%EC%87%A0_%EC%B2%A0_%EA%B0%95.html?hl=&id=QdsiwAEACAAJ",
//                    "publishedDate" : "2017",
//                    "title" : "쇠·철·강",
//                    "industryIdentifiers" : [
//                      {
//                        "type" : "ISBN_10",
//                        "identifier" : "8993518432"
//                      },
//                      {
//                        "type" : "ISBN_13",
//                        "identifier" : "9788993518436"
//                      }
//                    ],
//                    "printType" : "BOOK",
//                    "maturityRating" : "NOT_MATURE",
//                    "allowAnonLogging" : false,
//                    "language" : "ko",
//                    "previewLink" : "http://books.google.co.kr/books?id=QdsiwAEACAAJ&dq=%EC%B2%A0&hl=&cd=3&source=gbs_api",
//                    "panelizationSummary" : {
//                      "containsImageBubbles" : false,
//                      "containsEpubBubbles" : false
//                    }
//                  },
//                  "id" : "QdsiwAEACAAJ",
//                  "saleInfo" : {
//                    "country" : "KR",
//                    "saleability" : "NOT_FOR_SALE",
//                    "isEbook" : false
//                  },
//                  "accessInfo" : {
//                    "viewability" : "NO_PAGES",
//                    "publicDomain" : false,
//                    "country" : "KR",
//                    "accessViewStatus" : "NONE",
//                    "webReaderLink" : "http://play.google.com/books/reader?id=QdsiwAEACAAJ&hl=&source=gbs_api",
//                    "quoteSharingAllowed" : false,
//                    "textToSpeechPermission" : "ALLOWED",
//                    "pdf" : {
//                      "isAvailable" : false
//                    },
//                    "embeddable" : false,
//                    "epub" : {
//                      "isAvailable" : false
//                    }
//                  },
//                  "kind" : "books#volume",
//                  "etag" : "2XQzLHj06Ow"
//                },
//                {
//                  "selfLink" : "https://www.googleapis.com/books/v1/volumes/cwhRDwAAQBAJ",
//                  "volumeInfo" : {
//                    "description" : "“나는 죽어 나비가 되고…….” 천형을 타고난 소녀 진설하. 그런 소녀를 사랑한 하청운. “나는 죽어 바람이 되어…….” 심장에 새겨진 소중한 약속을 지키기 위해 철검 한 자루를 손에 쥐고, 운명을 개척한다!! “설국에 만들어 놓은 낙원으로 그대와 함께 가리라.”",
//                    "categories" : [
//                      "Fiction"
//                    ],
//                    "readingModes" : {
//                      "image" : true,
//                      "text" : true
//                    },
//                    "contentVersion" : "1.1.2.0.preview.3",
//                    "infoLink" : "https://play.google.com/store/books/details?id=cwhRDwAAQBAJ&source=gbs_api",
//                    "canonicalVolumeLink" : "https://play.google.com/store/books/details?id=cwhRDwAAQBAJ",
//                    "authors" : [
//                      "K.석우"
//                    ],
//                    "publishedDate" : "2017-01-10",
//                    "title" : "철검록 2",
//                    "publisher" : "컨텐츠헤라",
//                    "industryIdentifiers" : [
//                      {
//                        "type" : "ISBN_13",
//                        "identifier" : "9791157426737"
//                      }
//                    ],
//                    "printType" : "BOOK",
//                    "maturityRating" : "NOT_MATURE",
//                    "pageCount" : 300,
//                    "allowAnonLogging" : true,
//                    "imageLinks" : {
//                      "thumbnail" : "http://books.google.com/books/content?id=cwhRDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
//                      "smallThumbnail" : "http://books.google.com/books/content?id=cwhRDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
//                    },
//                    "language" : "ko",
//                    "previewLink" : "http://books.google.co.kr/books?id=cwhRDwAAQBAJ&printsec=frontcover&dq=%EC%B2%A0&hl=&cd=4&source=gbs_api",
//                    "panelizationSummary" : {
//                      "containsImageBubbles" : false,
//                      "containsEpubBubbles" : false
//                    }
//                  },
//                  "id" : "cwhRDwAAQBAJ",
//                  "saleInfo" : {
//                    "listPrice" : {
//                      "amount" : 3200,
//                      "currencyCode" : "KRW"
//                    },
//                    "offers" : [
//                      {
//                        "listPrice" : {
//                          "amountInMicros" : 3200000000,
//                          "currencyCode" : "KRW"
//                        },
//                        "retailPrice" : {
//                          "amountInMicros" : 2880000000,
//                          "currencyCode" : "KRW"
//                        },
//                        "finskyOfferType" : 1
//                      },
//                      {
//                        "listPrice" : {
//                          "amountInMicros" : 900000000,
//                          "currencyCode" : "KRW"
//                        },
//                        "retailPrice" : {
//                          "amountInMicros" : 900000000,
//                          "currencyCode" : "KRW"
//                        },
//                        "finskyOfferType" : 3,
//                        "rentalDuration" : {
//                          "count" : 24,
//                          "unit" : "HOUR"
//                        }
//                      }
//                    ],
//                    "country" : "KR",
//                    "saleability" : "FOR_SALE_AND_RENTAL",
//                    "retailPrice" : {
//                      "amount" : 2880,
//                      "currencyCode" : "KRW"
//                    },
//                    "isEbook" : true,
//                    "buyLink" : "https://play.google.com/store/books/details?id=cwhRDwAAQBAJ&rdid=book-cwhRDwAAQBAJ&rdot=1&source=gbs_api"
//                  },
//                  "accessInfo" : {
//                    "viewability" : "PARTIAL",
//                    "publicDomain" : false,
//                    "country" : "KR",
//                    "accessViewStatus" : "SAMPLE",
//                    "webReaderLink" : "http://play.google.com/books/reader?id=cwhRDwAAQBAJ&hl=&source=gbs_api",
//                    "quoteSharingAllowed" : false,
//                    "textToSpeechPermission" : "ALLOWED",
//                    "pdf" : {
//                      "isAvailable" : true,
//                      "acsTokenLink" : "http://books.google.co.kr/books/download/%EC%B2%A0%EA%B2%80%EB%A1%9D_2-sample-pdf.acsm?id=cwhRDwAAQBAJ&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
//                    },
//                    "embeddable" : true,
//                    "epub" : {
//                      "isAvailable" : true,
//                      "acsTokenLink" : "http://books.google.co.kr/books/download/%EC%B2%A0%EA%B2%80%EB%A1%9D_2-sample-epub.acsm?id=cwhRDwAAQBAJ&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
//                    }
//                  },
//                  "searchInfo" : {
//                    "textSnippet" : "“나는 죽어 나비가 되고…….” 천형을 타고난 소녀 진설하. 그런 소녀를 사랑한 하청운. “나는 죽어 바람이 되어…….” 심장에 새겨진 소중한 약속을 지키기 위해 철검 한 ..."
//                  },
//                  "kind" : "books#volume",
//                  "etag" : "kBZMMIKQqAo"
//                },
//                {
//                  "selfLink" : "https://www.googleapis.com/books/v1/volumes/dwhRDwAAQBAJ",
//                  "volumeInfo" : {
//                    "description" : "“나는 죽어 나비가 되고…….” 천형을 타고난 소녀 진설하. 그런 소녀를 사랑한 하청운. “나는 죽어 바람이 되어…….” 심장에 새겨진 소중한 약속을 지키기 위해 철검 한 자루를 손에 쥐고, 운명을 개척한다!! “설국에 만들어 놓은 낙원으로 그대와 함께 가리라.”",
//                    "categories" : [
//                      "Fiction"
//                    ],
//                    "readingModes" : {
//                      "image" : true,
//                      "text" : true
//                    },
//                    "contentVersion" : "1.1.2.0.preview.3",
//                    "infoLink" : "https://play.google.com/store/books/details?id=dwhRDwAAQBAJ&source=gbs_api",
//                    "canonicalVolumeLink" : "https://play.google.com/store/books/details?id=dwhRDwAAQBAJ",
//                    "authors" : [
//                      "K.석우"
//                    ],
//                    "publishedDate" : "2017-03-07",
//                    "title" : "철검록 4",
//                    "publisher" : "컨텐츠헤라",
//                    "industryIdentifiers" : [
//                      {
//                        "type" : "ISBN_13",
//                        "identifier" : "9791157426836"
//                      }
//                    ],
//                    "printType" : "BOOK",
//                    "maturityRating" : "NOT_MATURE",
//                    "pageCount" : 300,
//                    "allowAnonLogging" : true,
//                    "imageLinks" : {
//                      "thumbnail" : "http://books.google.com/books/content?id=dwhRDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
//                      "smallThumbnail" : "http://books.google.com/books/content?id=dwhRDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
//                    },
//                    "language" : "ko",
//                    "previewLink" : "http://books.google.co.kr/books?id=dwhRDwAAQBAJ&printsec=frontcover&dq=%EC%B2%A0&hl=&cd=5&source=gbs_api",
//                    "panelizationSummary" : {
//                      "containsImageBubbles" : false,
//                      "containsEpubBubbles" : false
//                    }
//                  },
//                  "id" : "dwhRDwAAQBAJ",
//                  "saleInfo" : {
//                    "listPrice" : {
//                      "amount" : 3200,
//                      "currencyCode" : "KRW"
//                    },
//                    "offers" : [
//                      {
//                        "listPrice" : {
//                          "amountInMicros" : 3200000000,
//                          "currencyCode" : "KRW"
//                        },
//                        "retailPrice" : {
//                          "amountInMicros" : 2880000000,
//                          "currencyCode" : "KRW"
//                        },
//                        "finskyOfferType" : 1
//                      },
//                      {
//                        "listPrice" : {
//                          "amountInMicros" : 900000000,
//                          "currencyCode" : "KRW"
//                        },
//                        "retailPrice" : {
//                          "amountInMicros" : 900000000,
//                          "currencyCode" : "KRW"
//                        },
//                        "finskyOfferType" : 3,
//                        "rentalDuration" : {
//                          "count" : 24,
//                          "unit" : "HOUR"
//                        }
//                      }
//                    ],
//                    "country" : "KR",
//                    "saleability" : "FOR_SALE_AND_RENTAL",
//                    "retailPrice" : {
//                      "amount" : 2880,
//                      "currencyCode" : "KRW"
//                    },
//                    "isEbook" : true,
//                    "buyLink" : "https://play.google.com/store/books/details?id=dwhRDwAAQBAJ&rdid=book-dwhRDwAAQBAJ&rdot=1&source=gbs_api"
//                  },
//                  "accessInfo" : {
//                    "viewability" : "PARTIAL",
//                    "publicDomain" : false,
//                    "country" : "KR",
//                    "accessViewStatus" : "SAMPLE",
//                    "webReaderLink" : "http://play.google.com/books/reader?id=dwhRDwAAQBAJ&hl=&source=gbs_api",
//                    "quoteSharingAllowed" : false,
//                    "textToSpeechPermission" : "ALLOWED",
//                    "pdf" : {
//                      "isAvailable" : true,
//                      "acsTokenLink" : "http://books.google.co.kr/books/download/%EC%B2%A0%EA%B2%80%EB%A1%9D_4-sample-pdf.acsm?id=dwhRDwAAQBAJ&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
//                    },
//                    "embeddable" : true,
//                    "epub" : {
//                      "isAvailable" : true,
//                      "acsTokenLink" : "http://books.google.co.kr/books/download/%EC%B2%A0%EA%B2%80%EB%A1%9D_4-sample-epub.acsm?id=dwhRDwAAQBAJ&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
//                    }
//                  },
//                  "searchInfo" : {
//                    "textSnippet" : "“나는 죽어 나비가 되고…….” 천형을 타고난 소녀 진설하. 그런 소녀를 사랑한 하청운. “나는 죽어 바람이 되어…….” 심장에 새겨진 소중한 약속을 지키기 위해 철검 한 ..."
//                  },
//                  "kind" : "books#volume",
//                  "etag" : "KtXMUlMFwFE"
//                },
//                {
//                  "selfLink" : "https://www.googleapis.com/books/v1/volumes/gQhRDwAAQBAJ",
//                  "volumeInfo" : {
//                    "description" : "“나는 죽어 나비가 되고…….” 천형을 타고난 소녀 진설하. 그런 소녀를 사랑한 하청운. “나는 죽어 바람이 되어…….” 심장에 새겨진 소중한 약속을 지키기 위해 철검 한 자루를 손에 쥐고, 운명을 개척한다!! “설국에 만들어 놓은 낙원으로 그대와 함께 가리라.”",
//                    "categories" : [
//                      "Fiction"
//                    ],
//                    "readingModes" : {
//                      "image" : true,
//                      "text" : true
//                    },
//                    "contentVersion" : "1.1.2.0.preview.3",
//                    "infoLink" : "https://play.google.com/store/books/details?id=gQhRDwAAQBAJ&source=gbs_api",
//                    "canonicalVolumeLink" : "https://play.google.com/store/books/details?id=gQhRDwAAQBAJ",
//                    "authors" : [
//                      "K.석우"
//                    ],
//                    "publishedDate" : "2017-04-05",
//                    "title" : "철검록 5",
//                    "publisher" : "컨텐츠헤라",
//                    "industryIdentifiers" : [
//                      {
//                        "type" : "ISBN_13",
//                        "identifier" : "9791157426898"
//                      }
//                    ],
//                    "printType" : "BOOK",
//                    "maturityRating" : "NOT_MATURE",
//                    "pageCount" : 300,
//                    "allowAnonLogging" : true,
//                    "imageLinks" : {
//                      "thumbnail" : "http://books.google.com/books/content?id=gQhRDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
//                      "smallThumbnail" : "http://books.google.com/books/content?id=gQhRDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
//                    },
//                    "language" : "ko",
//                    "previewLink" : "http://books.google.co.kr/books?id=gQhRDwAAQBAJ&printsec=frontcover&dq=%EC%B2%A0&hl=&cd=6&source=gbs_api",
//                    "panelizationSummary" : {
//                      "containsImageBubbles" : false,
//                      "containsEpubBubbles" : false
//                    }
//                  },
//                  "id" : "gQhRDwAAQBAJ",
//                  "saleInfo" : {
//                    "listPrice" : {
//                      "amount" : 3200,
//                      "currencyCode" : "KRW"
//                    },
//                    "offers" : [
//                      {
//                        "listPrice" : {
//                          "amountInMicros" : 3200000000,
//                          "currencyCode" : "KRW"
//                        },
//                        "retailPrice" : {
//                          "amountInMicros" : 2880000000,
//                          "currencyCode" : "KRW"
//                        },
//                        "finskyOfferType" : 1
//                      },
//                      {
//                        "listPrice" : {
//                          "amountInMicros" : 900000000,
//                          "currencyCode" : "KRW"
//                        },
//                        "retailPrice" : {
//                          "amountInMicros" : 900000000,
//                          "currencyCode" : "KRW"
//                        },
//                        "finskyOfferType" : 3,
//                        "rentalDuration" : {
//                          "count" : 24,
//                          "unit" : "HOUR"
//                        }
//                      }
//                    ],
//                    "country" : "KR",
//                    "saleability" : "FOR_SALE_AND_RENTAL",
//                    "retailPrice" : {
//                      "amount" : 2880,
//                      "currencyCode" : "KRW"
//                    },
//                    "isEbook" : true,
//                    "buyLink" : "https://play.google.com/store/books/details?id=gQhRDwAAQBAJ&rdid=book-gQhRDwAAQBAJ&rdot=1&source=gbs_api"
//                  },
//                  "accessInfo" : {
//                    "viewability" : "PARTIAL",
//                    "publicDomain" : false,
//                    "country" : "KR",
//                    "accessViewStatus" : "SAMPLE",
//                    "webReaderLink" : "http://play.google.com/books/reader?id=gQhRDwAAQBAJ&hl=&source=gbs_api",
//                    "quoteSharingAllowed" : false,
//                    "textToSpeechPermission" : "ALLOWED",
//                    "pdf" : {
//                      "isAvailable" : true,
//                      "acsTokenLink" : "http://books.google.co.kr/books/download/%EC%B2%A0%EA%B2%80%EB%A1%9D_5-sample-pdf.acsm?id=gQhRDwAAQBAJ&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
//                    },
//                    "embeddable" : true,
//                    "epub" : {
//                      "isAvailable" : true,
//                      "acsTokenLink" : "http://books.google.co.kr/books/download/%EC%B2%A0%EA%B2%80%EB%A1%9D_5-sample-epub.acsm?id=gQhRDwAAQBAJ&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
//                    }
//                  },
//                  "searchInfo" : {
//                    "textSnippet" : "“나는 죽어 나비가 되고…….” 천형을 타고난 소녀 진설하. 그런 소녀를 사랑한 하청운. “나는 죽어 바람이 되어…….” 심장에 새겨진 소중한 약속을 지키기 위해 철검 한 ..."
//                  },
//                  "kind" : "books#volume",
//                  "etag" : "XzwFc9gOhNw"
//                },
//                {
//                  "selfLink" : "https://www.googleapis.com/books/v1/volumes/RIkFMgAACAAJ",
//                  "volumeInfo" : {
//                    "infoLink" : "http://books.google.co.kr/books?id=RIkFMgAACAAJ&dq=%EC%B2%A0&hl=&source=gbs_api",
//                    "contentVersion" : "preview-1.0.0",
//                    "readingModes" : {
//                      "image" : false,
//                      "text" : false
//                    },
//                    "canonicalVolumeLink" : "https://books.google.com/books/about/%EC%B2%A0%EC%9D%B4_%EC%B2%A0%EC%9D%84_%EB%82%A0%EC%B9%B4%EB%A1%AD%EA%B2%8C_%ED%95%98%EB%8A%94_%EA%B2%83%EA%B0%99.html?hl=&id=RIkFMgAACAAJ",
//                    "authors" : [
//                      "하워드외"
//                    ],
//                    "publishedDate" : "1996-06-27",
//                    "title" : "철이 철을 날카롭게 하는 것같이",
//                    "industryIdentifiers" : [
//                      {
//                        "type" : "ISBN_10",
//                        "identifier" : "8935001848"
//                      },
//                      {
//                        "type" : "ISBN_13",
//                        "identifier" : "9788935001842"
//                      }
//                    ],
//                    "printType" : "BOOK",
//                    "maturityRating" : "NOT_MATURE",
//                    "allowAnonLogging" : false,
//                    "pageCount" : 408,
//                    "language" : "ko",
//                    "previewLink" : "http://books.google.co.kr/books?id=RIkFMgAACAAJ&dq=%EC%B2%A0&hl=&cd=7&source=gbs_api"
//                  },
//                  "id" : "RIkFMgAACAAJ",
//                  "saleInfo" : {
//                    "country" : "KR",
//                    "saleability" : "NOT_FOR_SALE",
//                    "isEbook" : false
//                  },
//                  "accessInfo" : {
//                    "viewability" : "NO_PAGES",
//                    "publicDomain" : false,
//                    "country" : "KR",
//                    "accessViewStatus" : "NONE",
//                    "webReaderLink" : "http://play.google.com/books/reader?id=RIkFMgAACAAJ&hl=&source=gbs_api",
//                    "quoteSharingAllowed" : false,
//                    "textToSpeechPermission" : "ALLOWED",
//                    "pdf" : {
//                      "isAvailable" : false
//                    },
//                    "embeddable" : false,
//                    "epub" : {
//                      "isAvailable" : false
//                    }
//                  },
//                  "kind" : "books#volume",
//                  "etag" : "ZWB09Gey7BU"
//                },
//                {
//                  "selfLink" : "https://www.googleapis.com/books/v1/volumes/RI0tAAAAIAAJ",
//                  "volumeInfo" : {
//                    "infoLink" : "http://books.google.co.kr/books?id=RI0tAAAAIAAJ&dq=%EC%B2%A0&hl=&source=gbs_api",
//                    "contentVersion" : "0.7.2.0.preview.0",
//                    "readingModes" : {
//                      "image" : false,
//                      "text" : false
//                    },
//                    "subtitle" : "장편 소설",
//                    "canonicalVolumeLink" : "https://books.google.com/books/about/%EC%B2%A0_%EC%9D%98_%EC%8B%A0%EB%85%90.html?hl=&id=RI0tAAAAIAAJ",
//                    "authors" : [
//                      "김리돈"
//                    ],
//                    "publishedDate" : "1986",
//                    "title" : "철 의 신념",
//                    "industryIdentifiers" : [
//                      {
//                        "type" : "OTHER",
//                        "identifier" : "UCAL:B3788279"
//                      }
//                    ],
//                    "printType" : "BOOK",
//                    "maturityRating" : "NOT_MATURE",
//                    "allowAnonLogging" : false,
//                    "pageCount" : 610,
//                    "language" : "ko",
//                    "imageLinks" : {
//                      "thumbnail" : "http://books.google.com/books/content?id=RI0tAAAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
//                      "smallThumbnail" : "http://books.google.com/books/content?id=RI0tAAAAIAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api"
//                    },
//                    "previewLink" : "http://books.google.co.kr/books?id=RI0tAAAAIAAJ&q=%EC%B2%A0&dq=%EC%B2%A0&hl=&cd=8&source=gbs_api",
//                    "panelizationSummary" : {
//                      "containsImageBubbles" : false,
//                      "containsEpubBubbles" : false
//                    }
//                  },
//                  "id" : "RI0tAAAAIAAJ",
//                  "saleInfo" : {
//                    "country" : "KR",
//                    "saleability" : "NOT_FOR_SALE",
//                    "isEbook" : false
//                  },
//                  "accessInfo" : {
//                    "viewability" : "NO_PAGES",
//                    "publicDomain" : false,
//                    "country" : "KR",
//                    "accessViewStatus" : "NONE",
//                    "webReaderLink" : "http://play.google.com/books/reader?id=RI0tAAAAIAAJ&hl=&source=gbs_api",
//                    "quoteSharingAllowed" : false,
//                    "textToSpeechPermission" : "ALLOWED",
//                    "pdf" : {
//                      "isAvailable" : false
//                    },
//                    "embeddable" : false,
//                    "epub" : {
//                      "isAvailable" : false
//                    }
//                  },
//                  "kind" : "books#volume",
//                  "etag" : "MNv4BB3Q0+Q"
//                },
//                {
//                  "selfLink" : "https://www.googleapis.com/books/v1/volumes/d8knDwAAQBAJ",
//                  "volumeInfo" : {
//                    "description" : "“나는 죽어 나비가 되고…….” 천형을 타고난 소녀 진설하. 그런 소녀를 사랑한 하청운. “나는 죽어 바람이 되어…….” 심장에 새겨진 소중한 약속을 지키기 위해 철검 한 자루를 손에 쥐고, 운명을 개척한다!! “설국에 만들어 놓은 낙원으로 그대와 함께 가리라.”",
//                    "categories" : [
//                      "Fiction"
//                    ],
//                    "readingModes" : {
//                      "image" : true,
//                      "text" : true
//                    },
//                    "contentVersion" : "0.1.1.0.preview.3",
//                    "infoLink" : "https://play.google.com/store/books/details?id=d8knDwAAQBAJ&source=gbs_api",
//                    "canonicalVolumeLink" : "https://play.google.com/store/books/details?id=d8knDwAAQBAJ",
//                    "authors" : [
//                      "K.석우"
//                    ],
//                    "publishedDate" : "2017-04-19",
//                    "title" : "[연재] 철검록 6화",
//                    "publisher" : "컨텐츠헤라",
//                    "industryIdentifiers" : [
//                      {
//                        "type" : "OTHER",
//                        "identifier" : "PKEY:HERA0004917"
//                      }
//                    ],
//                    "printType" : "BOOK",
//                    "maturityRating" : "NOT_MATURE",
//                    "pageCount" : 13,
//                    "allowAnonLogging" : true,
//                    "imageLinks" : {
//                      "thumbnail" : "http://books.google.com/books/content?id=d8knDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
//                      "smallThumbnail" : "http://books.google.com/books/content?id=d8knDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
//                    },
//                    "language" : "ko",
//                    "previewLink" : "http://books.google.co.kr/books?id=d8knDwAAQBAJ&printsec=frontcover&dq=%EC%B2%A0&hl=&cd=9&source=gbs_api",
//                    "panelizationSummary" : {
//                      "containsImageBubbles" : false,
//                      "containsEpubBubbles" : false
//                    }
//                  },
//                  "id" : "d8knDwAAQBAJ",
//                  "saleInfo" : {
//                    "saleability" : "FOR_SALE",
//                    "isEbook" : true,
//                    "country" : "KR",
//                    "listPrice" : {
//                      "amount" : 0,
//                      "currencyCode" : "KRW"
//                    },
//                    "retailPrice" : {
//                      "amount" : 0,
//                      "currencyCode" : "KRW"
//                    },
//                    "buyLink" : "https://play.google.com/store/books/details?id=d8knDwAAQBAJ&rdid=book-d8knDwAAQBAJ&rdot=1&source=gbs_api"
//                  },
//                  "accessInfo" : {
//                    "viewability" : "PARTIAL",
//                    "publicDomain" : false,
//                    "country" : "KR",
//                    "accessViewStatus" : "SAMPLE",
//                    "webReaderLink" : "http://play.google.com/books/reader?id=d8knDwAAQBAJ&hl=&source=gbs_api",
//                    "quoteSharingAllowed" : false,
//                    "textToSpeechPermission" : "ALLOWED",
//                    "pdf" : {
//                      "isAvailable" : true,
//                      "acsTokenLink" : "http://books.google.co.kr/books/download/%EC%97%B0%EC%9E%AC_%EC%B2%A0%EA%B2%80%EB%A1%9D_6%ED%99%94-sample-pdf.acsm?id=d8knDwAAQBAJ&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
//                    },
//                    "embeddable" : true,
//                    "epub" : {
//                      "isAvailable" : true,
//                      "acsTokenLink" : "http://books.google.co.kr/books/download/%EC%97%B0%EC%9E%AC_%EC%B2%A0%EA%B2%80%EB%A1%9D_6%ED%99%94-sample-epub.acsm?id=d8knDwAAQBAJ&format=epub&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
//                    }
//                  },
//                  "searchInfo" : {
//                    "textSnippet" : "“나는 죽어 나비가 되고…….” 천형을 타고난 소녀 진설하. 그런 소녀를 사랑한 하청운. “나는 죽어 바람이 되어…….” 심장에 새겨진 소중한 약속을 지키기 위해 철검 한 ..."
//                  },
//                  "kind" : "books#volume",
//                  "etag" : "+yMdeNi2FGc"
//                },
//                {
//                  "selfLink" : "https://www.googleapis.com/books/v1/volumes/NFaYzQEACAAJ",
//                  "volumeInfo" : {
//                    "infoLink" : "http://books.google.co.kr/books?id=NFaYzQEACAAJ&dq=%EC%B2%A0&hl=&source=gbs_api",
//                    "contentVersion" : "preview-1.0.0",
//                    "readingModes" : {
//                      "image" : false,
//                      "text" : false
//                    },
//                    "canonicalVolumeLink" : "https://books.google.com/books/about/%EC%B2%A0%EC%9D%84_%EB%B3%B4%EB%8B%88_%EC%84%B8%EC%83%81%EC%9D%B4_%EB%B3%B4%EC%9D%B8%EB%8B%A4_%EC%96%91%EC%9E%A5.html?hl=&id=NFaYzQEACAAJ",
//                    "authors" : [
//                      "권오준"
//                    ],
//                    "publishedDate" : "2020-06-10",
//                    "title" : "철을 보니 세상이 보인다(양장본 HardCover)",
//                    "industryIdentifiers" : [
//                      {
//                        "type" : "ISBN_13",
//                        "identifier" : "9791197058806"
//                      }
//                    ],
//                    "printType" : "BOOK",
//                    "maturityRating" : "NOT_MATURE",
//                    "allowAnonLogging" : false,
//                    "pageCount" : 528,
//                    "language" : "ko",
//                    "previewLink" : "http://books.google.co.kr/books?id=NFaYzQEACAAJ&dq=%EC%B2%A0&hl=&cd=10&source=gbs_api",
//                    "panelizationSummary" : {
//                      "containsImageBubbles" : false,
//                      "containsEpubBubbles" : false
//                    }
//                  },
//                  "id" : "NFaYzQEACAAJ",
//                  "saleInfo" : {
//                    "country" : "KR",
//                    "saleability" : "NOT_FOR_SALE",
//                    "isEbook" : false
//                  },
//                  "accessInfo" : {
//                    "viewability" : "NO_PAGES",
//                    "publicDomain" : false,
//                    "country" : "KR",
//                    "accessViewStatus" : "NONE",
//                    "webReaderLink" : "http://play.google.com/books/reader?id=NFaYzQEACAAJ&hl=&source=gbs_api",
//                    "quoteSharingAllowed" : false,
//                    "textToSpeechPermission" : "ALLOWED",
//                    "pdf" : {
//                      "isAvailable" : false
//                    },
//                    "embeddable" : false,
//                    "epub" : {
//                      "isAvailable" : false
//                    }
//                  },
//                  "kind" : "books#volume",
//                  "etag" : "soO22mfXBuc"
//                }
//              ]
//            }
//            """
//            let jsonData = json.data(using: .utf8)!
//            let model = try JSONDecoder().decode(VolumeSearchResultsDTO.self, from: jsonData)
////            return model
//
//        }
//    }
//}

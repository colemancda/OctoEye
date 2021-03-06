//
//  FetchRootItemsSpec.swift
//  Tests
//
//  Created by mzp on 2017/07/07.
//  Copyright © 2017 mzp. All rights reserved.
//

import JetToTheFuture
import Nimble
import Quick
import Result

internal class FetchRootItemsSpec: QuickSpec {
    override func spec() {
        let github = GithubClient(
            token: "-",
            httpRequest: MockHttpRequest(response: fixture(name: "defaultBranch", ofType: "json")))
        let entries = forcedFuture { _ in
            FetchRootItems(github: github).call(owner: "mzp", name: "LoveLiver")
        }.value

        describe("entries") {
            it("have all element") {
                expect(entries).to(haveCount(2))
            }

            it("contains entry") {
                expect(entries?[0].oid) == "71c8b4b6dcef4813a6d012b753a00eb973b616c6"
                expect(entries?[1].oid) == "80e89cfb4085595e5d90d762ac716a8cd775fb38"
            }
        }
    }
}

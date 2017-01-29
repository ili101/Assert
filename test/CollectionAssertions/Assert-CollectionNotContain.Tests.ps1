InModuleScope -ModuleName Assert {
    Describe "Assert-CollectionNotContain" {
        It "Fails when collection of single item contains the expected item" {
            $error = { @(1) | Assert-CollectionNotContain 1 } | Verify-AssertionFailed
            $error.Exception.Message | Verify-Equal "Expected int '1' to not be present in collection '1', but it was there."
        }

        It "Passes when collection of single item does not contain the expected item" {
            @(5) | Assert-CollectionNotContain 1
        }

        It "Fails when collection of multiple items contains the expected item" {
            $error = { @(1,2,3) | Assert-CollectionNotContain 1 } | Verify-AssertionFailed
            $error.Exception.Message | Verify-Equal "Expected int '1' to not be present in collection '1, 2, 3', but it was there."
        }

        It "Passes when collection of multiple items does not contain the expected item" {
            @(5,6,7) | Assert-CollectionNotContain 1
        }
    }
}
using System;
using System.Linq;
using api.Controllers;
using Xunit;

namespace tests
{
    public class RangeTests
    {
        [Fact]
        public void CountShouldControlNofResults()
        {
            var range = new Range { Count = 3 };
            var generated = range.Of(() => "");
            Assert.Equal(3, generated.Count());
        }
    }
}

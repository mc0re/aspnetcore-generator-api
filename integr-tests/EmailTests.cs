using System;
using System.Net.Http;
using System.Threading.Tasks;
using FluentAssertions.Json;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Xunit;


namespace integr_tests
{
    public class EmailTests
    {
        private const string GeneratorApiRoot = "http://generator";

        private const string MailHogApiRoot = "http://mail:8025/api/v2";


        [Fact]
        public async Task SendEmailsWithNames()
        {
            var client = new HttpClient();

            // Make generator send email
            var sendEmail = new HttpRequestMessage
            {
                Method = HttpMethod.Post,
                RequestUri = new Uri($"{GeneratorApiRoot}/EmailRandomNames")
            };

            Console.WriteLine($"Sending email via {sendEmail.RequestUri}");

            using (var response = await client.SendAsync(sendEmail))
            {
                response.EnsureSuccessStatusCode();
            }

            // Check the email was sent
            var checkEmails = new HttpRequestMessage
            {
                Method = HttpMethod.Get,
                RequestUri = new Uri($"{MailHogApiRoot}/messages")
            };

            Console.WriteLine($"Checking messages via {checkEmails.RequestUri}");

            using (var response = await client.SendAsync(checkEmails))
            {
                response.EnsureSuccessStatusCode();
                var content = await response.Content.ReadAsStringAsync();
                var messages = JObject.Parse(content);
                messages.Should().HaveElement("total")
                    .Which.Should().BeEquivalentTo(1);
                messages.Should().HaveElement("items")
                    .Which.Should().BeOfType<JArray>()
                    .Which.First.Should().HaveElement("Raw")
                        .Which.Should().HaveElement("From")
                            .Which.Should().HaveValue("ggenerator@generate.com")
                ;
            }
        }
    }
}

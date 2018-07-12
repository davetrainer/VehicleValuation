using Microsoft.VisualStudio.TestTools.UnitTesting;
using VehicleValuation.Services.Services;

namespace VehicleValuation.Services.IntegrationTests
{
    [TestClass]
    public class EncryptionServiceTests
    {

        #region Constants

        #endregion

        #region Constructors

        #endregion

        #region Events & Delegates

        #endregion

        #region Properties

        #endregion

        #region Methods

        [TestMethod]
        public void TestThatEncryptionWithDynamicSaltIsDecryptedCorrectly()
        {
            var salt = EncryptionService.GetSalt();

            var toEncrypt = "TestValue";

            var encrypted = EncryptionService.Encrypt(toEncrypt, salt);

            var decrypted = EncryptionService.Decrypt(encrypted, salt);

            Assert.AreEqual(toEncrypt, decrypted);
        }

        [TestMethod]
        public void TestThatEncryptionWithEmptySaltReturnsEmptyString()
        {
            var salt = string.Empty;

            var toEncrypt = "TestValue";

            var encrypted = EncryptionService.Encrypt(toEncrypt, salt);

            var decrypted = EncryptionService.Decrypt(encrypted, salt);

            Assert.AreEqual(encrypted, string.Empty);
            Assert.AreEqual(decrypted, string.Empty);
        }

        [TestMethod]
        public void TestThatEncryptionWithEmptyValueReturnsEmptyString()
        {
            var salt = EncryptionService.GetSalt();

            var toEncrypt = string.Empty;

            var encrypted = EncryptionService.Encrypt(toEncrypt, salt);

            var decrypted = EncryptionService.Decrypt(encrypted, salt);

            Assert.AreEqual(encrypted, string.Empty);
            Assert.AreEqual(decrypted, string.Empty);
        }

        [TestMethod]
        public void TestThatEncryptionServiceGetSaltIsDynamic()
        {
            var salt = EncryptionService.GetSalt();
            var newSalt = EncryptionService.GetSalt();

            Assert.AreNotEqual(salt, newSalt);
        }

        #endregion
    }
}

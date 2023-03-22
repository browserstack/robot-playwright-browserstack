async function SetStatus(teststatus, page) {
  if (teststatus == 1) {
    await page.evaluate(_ => { }, `browserstack_executor: ${JSON.stringify({ action: 'setSessionStatus', arguments: { status: 'passed', reason: ':-)' } })}`);
  } else {
    await page.evaluate(_ => { }, `browserstack_executor: ${JSON.stringify({ action: 'setSessionStatus', arguments: { status: 'failed', reason: ':-(' } })}`);
  }
}

async function SetSessionName(testname, page) {
    await page.evaluate((testname) => { }, `browserstack_executor: ${JSON.stringify({ action: 'setSessionName', arguments: { name: testname} })}`);
}

exports.__esModule = true;
exports.SetStatus = SetStatus;
exports.SetSessionName = SetSessionName;

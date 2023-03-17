async function SetStatus(teststatus, page) {
  if (teststatus == 'PASS') {
    await page.evaluate(_ => { }, `browserstack_executor: ${JSON.stringify({ action: 'setSessionStatus', arguments: { status: 'passed', reason: ':-)' } })}`);
  } else {
    await page.evaluate(_ => { }, `browserstack_executor: ${JSON.stringify({ action: 'setSessionStatus', arguments: { status: 'failed', reason: ':-(' } })}`);
  }
}

async function SetSessionName(testname, page) {
    await page.evaluate(_ => { }, `browserstack_executor: ${JSON.stringify({ action: 'setSessionName', arguments: { name: 'TESTNAME'} })}`);
}

exports.__esModule = true;
exports.SetStatus = SetStatus;
exports.SetSessionName = SetSessionName;

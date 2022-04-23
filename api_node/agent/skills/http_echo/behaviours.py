
# -*- coding: utf-8 -*-
# ------------------------------------------------------------------------------
#
#   Copyright 2018-2020 Fetch.AI Limited
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
# ------------------------------------------------------------------------------

"""This package contains the behaviour for the erc-1155 client skill."""

from typing import Any, cast

from aea.skills.behaviours import TickerBehaviour, OneShotBehaviour

from packages.fetchai.connections.ledger.base import (
    CONNECTION_ID as LEDGER_CONNECTION_PUBLIC_ID,
)
from packages.fetchai.protocols.ledger_api.message import LedgerApiMessage
from packages.default_author.skills.http_echo.dialogues import (
    LedgerApiDialogues,
)
from packages.default_author.skills.http_echo.strategy import Strategy


LEDGER_API_ADDRESS = str(LEDGER_CONNECTION_PUBLIC_ID)


class BalanceBehaviour(OneShotBehaviour):
    """This class implements a search behaviour."""

    def __init__(self, **kwargs: Any) -> None:
        """Initialize the search behaviour."""
        super().__init__(**kwargs)

    def setup(self) -> None:
        """Implement the setup for the behaviour."""
        strategy = cast(Strategy, self.context.strategy)
        ledger_api_dialogues = cast(
            LedgerApiDialogues, self.context.ledger_api_dialogues
        )
        ledger_api_msg, _ = ledger_api_dialogues.create(
            counterparty=LEDGER_API_ADDRESS,
            performative=LedgerApiMessage.Performative.GET_BALANCE,
            ledger_id=strategy.ledger_id,
            address=cast(str, self.context.agent_addresses.get(strategy.ledger_id)),
        )
        self.context.outbox.put_message(message=ledger_api_msg)

    def act(self) -> None:
        """Implement the act."""
        pass

    def teardown(self) -> None:
        """Implement the task teardown."""

from typing import Any

from aea.helpers.search.generic import SIMPLE_SERVICE_MODEL
from aea.helpers.search.models import Constraint, ConstraintType, Location, Query
from aea.skills.base import Model



class Strategy(Model):
    """This class defines a strategy for the agent."""

    def __init__(self, **kwargs: Any) -> None:
        """
        Initialize the strategy of the agent.

        :param kwargs: keyword arguments
        """
        ledger_id = kwargs.pop("ledger_id", None)
        super().__init__(**kwargs)
        self._ledger_id = (
            ledger_id if ledger_id is not None else self.context.default_ledger_id
        )
#       self._contract_id = str(CONTRACT_ID)

    @property
    def ledger_id(self) -> str:
        """Get the ledger id."""
        return self._ledger_id

    @property
    def contract_id(self) -> str:
        """Get the contract id."""
        return self._contract_id

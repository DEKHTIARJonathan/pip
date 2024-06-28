"""Generate and work with PEP ??? Custom Arch Plugin.
"""

from abc import ABC, abstractmethod
from typing import List, Self


class BaseCustomArchPlugin(ABC):
    
    @staticmethod
    @abstractmethod
    def get_compatible_custom_archs() -> List[str]:
        raise NotImplementedError()
    

def get_all_custom_archs():
    return [
        arch 
        for PluginCls in BaseCustomArchPlugin.__subclasses__()
        for arch in reversed(PluginCls.get_compatible_custom_archs())
    ]

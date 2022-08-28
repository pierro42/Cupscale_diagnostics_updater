import torch
from typing import List



def get_device_number():

    num = torch.cuda.device_count()
    return num


def get_device_capability():

    prop = torch.cuda.get_device_capability(0)
    return prop


    


def is_available() -> bool:
    r"""Returns a bool indicating if CUDA is currently available."""
    if (not hasattr(torch._C, '_cuda_isDriverSufficient') or
            not torch._C._cuda_isDriverSufficient()):
        return False
    return torch._C._cuda_getDeviceCount() > 0
 

def get_arch_list() -> List[str]:
    r"""Returns list CUDA architecutres this library was compiled for."""
    if not is_available():
        return []
    arch_flags = torch._C._cuda_getArchFlags()
    if arch_flags is None:
        return []
    return arch_flags.split()

incompatible_device_warn = """
{} with CUDA capability sm_{} is not compatible with the current PyTorch installation.
The current PyTorch install supports CUDA capabilities {}.
If you want to use the {} GPU with PyTorch, please check the instructions at https://pytorch.org/get-started/locally/
"""
if torch.version.cuda is None:  # on ROCm we don't want this check
    print('CUDA not installed ?')
arch_list = get_arch_list()
if len(arch_list) == 0:
    print('No cuda ARCH ?')
supported_sm = [int(arch.split('_')[1]) for arch in arch_list if 'sm_' in arch]

cap_major, cap_minor = get_device_capability()
capability = cap_major * 10 + cap_minor
# NVIDIA GPU compute architectures are backward compatible within 5 minor revisions versions
supported = any([capability >= sm and capability - (sm // 5) * 5 < 5 for sm in supported_sm])
if not supported:
    device_name = torch.cuda.get_device_name()
    warning_message = incompatible_device_warn.format(device_name, capability, " ".join(arch_list), device_name)




with open('status.txt', 'a') as f:
    f.write('\n\nEmbedded Python configuration : \n\n')
    
    if get_device_number() > 1:
        f.write("\n\n !!!!!!! WARNING !!!!!!! : There's more than one card, checking the first one ONLY !\n")
    
    
    f.write(f'\nGPU id 0 : {torch.cuda.get_device_name(0)}')
    
    f.write(f'\nTorch CUDA: {torch.version.cuda}')
    
    f.write(f'\nTorch debug mode: {torch.version.debug}')
    
    f.write(f'\nTorch git : {torch.version.git_version}')
    
    pytorch_archlist = torch.cuda.get_arch_list()
    f.write(f'\npytorch arch list: {str(pytorch_archlist)}')
    
    device_capability=torch.cuda.get_device_capability(0)
    f.write(f'\nGPU Capability : {str(device_capability)}')
    
    f.write(f'\n\n\n{warning_message}')

    f.write("________________________________________")
    f.write('\n\n\nEND OF SCRPIT')
    
    f.close()


print("________________________________________")
print('\n\n\nEND OF SCRPIT')


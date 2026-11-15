#include <stdio.h>
#include <stdlib.h>
#include <libusb-1.0/libusb.h>

void print_serial_number(libusb_device *device, struct libusb_device_descriptor *descriptor) {
    libusb_device_handle *device_handle = NULL;
    int result = libusb_open(device, &device_handle);
    
    if (result < 0) {
        printf(" (Не удалось открыть для чтения серийного номера)");
        return;
    }
    
    if (descriptor->iSerialNumber > 0) {
        unsigned char serial_buffer[256];
        result = libusb_get_string_descriptor_ascii(device_handle, descriptor->iSerialNumber, serial_buffer, sizeof(serial_buffer));
        
        if (result > 0) {
            printf(" | S/N: %s", serial_buffer);
        } else {
            printf(" | S/N: ошибка чтения");
        }
    } else {
        printf(" | S/N: нет");
    }
    
    libusb_close(device_handle);
}

void print_device_info(libusb_device *device) {
    struct libusb_device_descriptor descriptor;
    int result = libusb_get_device_descriptor(device, &descriptor);
    
    if (result < 0) {
        printf("Ошибка получения дескриптора\n");
        return;
    }

    // Вывод класса, VID, PID
    printf("Class: %02x | VID: %04x | PID: %04x", 
           (int)descriptor.bDeviceClass, 
           descriptor.idVendor, 
           descriptor.idProduct);
    
    // Вывод серийного номера
    print_serial_number(device, &descriptor);
    printf("\n");
}

int main() {
    libusb_context *context = NULL;
    libusb_device **device_list;
    
    int result = libusb_init(&context);
    if (result < 0) {
        fprintf(stderr, "Ошибка инициализации libusb\n");
        return 1;
    }

    ssize_t device_count = libusb_get_device_list(context, &device_list);
    if (device_count < 0) {
        fprintf(stderr, "Ошибка получения списка устройств\n");
        libusb_exit(context);
        return 1;
    }

    printf("Найдено USB-устройств: %ld\n", (long)device_count);
    printf("========================================\n");

    for (ssize_t i = 0; i < device_count; i++) {
        print_device_info(device_list[i]);
    }

    libusb_free_device_list(device_list, 1);
    libusb_exit(context);
    return 0;
}

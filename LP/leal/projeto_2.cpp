#include <iostream>
#include <fstream>
#include <vector>
#include <string>

using namespace std;

//estrutura do carro
struct Car {
    string brand;
    string model;
    string registration;
    int year;
    string color;
    double price;
};

//adicionar um novo carro à lista
void addCar(vector<Car>& cars) {
    Car newCar;
    cout << "Digite a marca do carro: ";
    cin.ignore();
    getline(cin, newCar.brand);
    cout << "Digite o modelo do carro: ";
    getline(cin, newCar.model);
    cout << "Digite a matrícula do carro: ";
    getline(cin, newCar.registration);
    cout << "Digite o ano do carro: ";
    cin >> newCar.year;
    cout << "Digite a cor do carro: ";
    cin.ignore();
    getline(cin, newCar.color);
    cout << "Digite o preço do carro: ";
    cin >> newCar.price;
    cars.push_back(newCar);
    cout << "Carro adicionado com sucesso." << endl;
}

//Mostrar todos os carros
void displayCars(const vector<Car>& cars) {
    if (cars.empty()) {
        cout << "Lista de carros vazia." << endl;
        return;
    }
    cout << "Lista de carros:" << endl;
    for (const auto& car : cars) {
        cout << "Marca: " << car.brand << ", Modelo: " << car.model << ", Matrícula: " << car.registration
             << ", Ano: " << car.year << ", Cor: " << car.color << ", Preço: " << car.price << endl;
    }
}

//pesquisar por um carro específico
void searchCar(const vector<Car>& cars) {
    string registration;
    cout << "Digite a matrícula do carro que deseja pesquisar: ";
    cin.ignore();
    getline(cin, registration);
    bool found = false;
    for (const auto& car : cars) {
        if (car.registration == registration) {
            cout << "Carro encontrado: Marca: " << car.brand << ", Modelo: " << car.model << ", Ano: " << car.year
                 << ", Cor: " << car.color << ", Preço: " << car.price << endl;
            found = true;
            break;
        }
    }
    if (!found) {
        cout << "Carro não encontrado." << endl;
    }
}

//atualizar informações de um carro
void updateCar(vector<Car>& cars) {
    string registration;
    cout << "Digite a matrícula do carro que deseja atualizar: ";
    cin.ignore();
    getline(cin, registration);
    bool found = false;
    for (auto& car : cars) {
        if (car.registration == registration) {
            cout << "Digite a nova marca: ";
            getline(cin, car.brand);
            cout << "Digite o novo modelo: ";
            getline(cin, car.model);
            cout << "Digite o novo ano: ";
            cin >> car.year;
            cout << "Digite a nova cor: ";
            cin.ignore();
            getline(cin, car.color);
            cout << "Digite o novo preço: ";
            cin >> car.price;
            cout << "Informações do carro atualizadas com sucesso." << endl;
            found = true;
            break;
        }
    }
    if (!found) {
        cout << "Carro não encontrado." << endl;
    }
}

//excluir um carro
void deleteCar(vector<Car>& cars) {
    string registration;
    cout << "Digite a matrícula do carro que deseja excluir: ";
    cin.ignore();
    getline(cin, registration);
    auto it = cars.begin();
    while (it != cars.end()) {
        if (it->registration == registration) {
            it = cars.erase(it);
            cout << "Carro excluído com sucesso." << endl;
            return;
        } else {
            ++it;
        }
    }
    cout << "Carro não encontrado." << endl;
}

//Guardar carros em um arquivo de texto
void saveToFile(const vector<Car>& cars, const string& filename) {
    ofstream file(filename);
    if (file.is_open()) {
        for (const auto& car : cars) {
            file << car.brand << "," << car.model << "," << car.registration << "," << car.year << ","
                 << car.color << "," << car.price << endl;
        }
        file.close();
        cout << "Carros Guardado com sucesso." << endl;
    } else {
        cout << "Erro ao abrir o arquivo." << endl;
    }
}

//carregar carros de um arquivo de texto
void loadFromFile(vector<Car>& cars, const string& filename) {
    ifstream file(filename);
    if (file.is_open()) {
        string line;
        while (getline(file, line)) {
            size_t pos = 0;
            string token;
            vector<string> tokens;
            while ((pos = line.find(",")) != string::npos) {
                token = line.substr(0, pos);
                tokens.push_back(token);
                line.erase(0, pos + 1);
            }
            tokens.push_back(line);
            if (tokens.size() == 6) {
                cars.push_back({tokens[0], tokens[1], tokens[2], stoi(tokens[3]), tokens[4], stod(tokens[5])});
            }
        }
        file.close();
        cout << "Carros carregados com sucesso." << endl;
    } else {
        cout << "Erro ao abrir o arquivo. Será criado um novo arquivo." << endl;
    }
}

int main() {
    vector<Car> cars;
    string filename = "cars.txt";//arquivo onde os carros serão salvos
    
    // Carregar os carros do arquivo
    loadFromFile(cars, filename);
    
    int choice;
    do {
        cout << "\nMenu:" << endl;
        cout << "1. Adicionar carro" << endl;
        cout << "2. Exibir todos os carros" << endl;
        cout << "3. Pesquisar carro" << endl;
        cout << "4. Atualizar carro" << endl;
        cout << "5. Excluir carro" << endl;
        cout << "6. Guardar e sair" << endl;
        cout << "Escolha uma opção: ";
        cin >> choice;
        
        switch (choice) {
            case 1:
                addCar(cars);
                break;
            case 2:
                displayCars(cars);
                break;
            case 3:
                searchCar(cars);
                break;
            case 4:
                updateCar(cars);
                break;
            case 5:
                deleteCar(cars);
                break;
            case 6:
                saveToFile(cars, filename);
                break;
            default:
                cout << "Opção inválida. Tente novamente." << endl;
        }
    } while (choice != 6);
    
    return 0;
}
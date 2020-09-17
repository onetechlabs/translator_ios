import UIKit

struct GlobalVars {
    static var base_url = "http://192.168.100.117:8000"
}

class ViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeInit = homeInitViewController()
        self.viewControllers=[homeInit]
    }
}

class ViewController2: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let aboutInit = aboutInitViewController()
        self.viewControllers=[aboutInit]
    }
}

class aboutInitViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    var AboutPage: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is a translation application, you only need to type a sentence and adjust the language options you want to translate."
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        
        label.padding = UIEdgeInsets(top: 0, left: 10, bottom: 5, right: 10)
        //wrappping text
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.frame.size.width = 300
        label.sizeToFit()
        return label
    }
    
    var AboutPageCopyright: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Copyright © Onetechlabs 2020"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        
        label.padding = UIEdgeInsets(top: 10, left: 10, bottom: 5, right: 10)
        //wrappping text
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.frame.size.width = 300
        label.sizeToFit()
        return label
    }
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*Init Navbar*/
        //init navigationbar to UIViewController
        let nav = self.navigationController?.navigationBar
        
        /*Init Navbar by Text*/
        navigationItem.title = "About - Translator"
        
        //set background color
        view.backgroundColor = UIColor(red: 0xdc, green: 0xdc, blue: 0xdc)
        setupViews()
        setupLayout()
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        let image = UIImage(named: "logo_with_name_vertical")!
        let imageView = UIImageView(image: image.imageWithInsets(insets: UIEdgeInsets(top: 30, left: 0, bottom: 5, right: 0)))
        imageView.widthAnchor.constraint(equalToConstant: 195).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        let textLabel2 = UILabel()
        //textLabel.backgroundColor = UIColor(red: 0x91, green: 0x2f, blue: 0x2a)
        textLabel2.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        textLabel2.padding = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        textLabel2.textAlignment = .center
        textLabel2.text = "Simple Translation for IOS"
        textLabel2.textColor = UIColor(red: 0xff, green: 0xff, blue: 0xff)
        
        //Stack View
        let sv   = UIStackView()
        sv.axis  = NSLayoutConstraint.Axis.vertical
        sv.distribution  = UIStackView.Distribution.equalSpacing
        sv.alignment = UIStackView.Alignment.center
        sv.spacing   = 10
        sv.addBackground(color: UIColor(red: 0x91, green: 0x2f, blue: 0x2a))
        
        sv.addArrangedSubview(imageView)
        sv.addArrangedSubview(textLabel2)
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(sv)
        stackView.addArrangedSubview(AboutPage)
        stackView.addArrangedSubview(AboutPageCopyright)
        
    }
    
    private func setupLayout() {
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}

class homeInitViewController: UIViewController, UITextFieldDelegate {
    var totranslatetext : UITextField!
    var translatedtext : UITextField!
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*Init Navbar*/
        //init navigationbar to UIViewController
        let nav = self.navigationController?.navigationBar
        
        /*Init Navbar by Image*/
        //setTitle Logo Image
        /*
         let imageView = UIImageView()
         imageView.contentMode = .scaleAspectFit
         let image = UIImage(named: "ic_launcher_round")
         imageView.image = image
         */
        //Set NavBar Title by Image
        //navigationItem.titleView = imageView
        
        /*Init Navbar by Text*/
        navigationItem.title = "Translator"
        
        //Create Navbar Right Button
        //create a new button
        let buttonNVR = UIButton.init(type: .custom)
        //set image for button
        buttonNVR.setImage(UIImage(named: "info"), for: UIControl.State.normal)
        //add function for button
        buttonNVR.addTarget(self, action: #selector(infoBtnPressed), for: UIControl.Event.touchUpInside)
        //set frame right navbar button
        buttonNVR.translatesAutoresizingMaskIntoConstraints = false
        buttonNVR.widthAnchor.constraint(equalToConstant: 30).isActive = true
        buttonNVR.heightAnchor.constraint(equalToConstant: 30).isActive = true
        let barbuttonNVR = UIBarButtonItem(customView: buttonNVR)
        //assign button to navigationbar
        navigationItem.rightBarButtonItem = barbuttonNVR
        
        //Create Navbar Left Button
        /*
         //create a new button
         let buttonNVL = UIButton.init(type: .custom)
         //set image for button
         buttonNVL.setImage(UIImage(named: "ic_launcher_round"), for: UIControl.State.normal)
         //add function for button
         buttonNVL.translatesAutoresizingMaskIntoConstraints = false
         buttonNVL.widthAnchor.constraint(equalToConstant: 30).isActive = true
         buttonNVL.heightAnchor.constraint(equalToConstant: 30).isActive = true
         let barbuttonNVL = UIBarButtonItem(customView: buttonNVL)
         //assign button to navigationbar
         navigationItem.leftBarButtonItem = barbuttonNVL
         */
        
        //set background color
        view.backgroundColor = UIColor(red: 0xdc, green: 0xdc, blue: 0xdc)
        setupViews()
        setupLayout()
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        let textLabel2 = UILabel()
        //textLabel.backgroundColor = UIColor(red: 0x91, green: 0x2f, blue: 0x2a)
        textLabel2.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        textLabel2.padding = UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5)
        textLabel2.textAlignment = .center
        textLabel2.text = "Start translate Indonesian to English language below!"
        //wrappping text
        textLabel2.lineBreakMode = .byWordWrapping
        textLabel2.numberOfLines = 0
        textLabel2.frame.size.width = 300
        textLabel2.sizeToFit()
        textLabel2.textColor = UIColor(red: 0xff, green: 0xff, blue: 0xff)
        
        //Stack View
        let sv   = UIStackView()
        sv.axis  = NSLayoutConstraint.Axis.vertical
        sv.distribution  = UIStackView.Distribution.equalSpacing
        sv.alignment = UIStackView.Alignment.center
        sv.spacing   = 10
        sv.addBackground(color: UIColor(red: 0x91, green: 0x2f, blue: 0x2a))
        
        sv.addArrangedSubview(textLabel2)
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        //Forms
        let texttotranslateLabel = UILabel()
        //textLabel.backgroundColor = UIColor(red: 0x91, green: 0x2f, blue: 0x2a)
        texttotranslateLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        texttotranslateLabel.padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        texttotranslateLabel.textAlignment = .left
        texttotranslateLabel.text = "Indonesian Language:"
        //wrappping text
        texttotranslateLabel.lineBreakMode = .byWordWrapping
        texttotranslateLabel.numberOfLines = 0
        texttotranslateLabel.frame.size.width = 300
        texttotranslateLabel.sizeToFit()
        texttotranslateLabel.textColor = UIColor(red: 0x91, green: 0x2f, blue: 0x2a)
        
        totranslatetext =  UITextField()
        totranslatetext.placeholder = "Write something here !"
        totranslatetext.font = UIFont.systemFont(ofSize: 15)
        totranslatetext.borderStyle = UITextField.BorderStyle.roundedRect
        totranslatetext.autocorrectionType = UITextAutocorrectionType.no
        totranslatetext.keyboardType = UIKeyboardType.default
        totranslatetext.returnKeyType = UIReturnKeyType.done
        totranslatetext.clearButtonMode = UITextField.ViewMode.whileEditing
        totranslatetext.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        totranslatetext.delegate = self
        totranslatetext.setLeftPaddingPoints(10)
        totranslatetext.setRightPaddingPoints(10)
        
        let texttranslatedLabel = UILabel()
        //textLabel.backgroundColor = UIColor(red: 0x91, green: 0x2f, blue: 0x2a)
        texttranslatedLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        texttranslatedLabel.padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        texttranslatedLabel.textAlignment = .left
        texttranslatedLabel.text = "English Language :"
        //wrappping text
        texttranslatedLabel.lineBreakMode = .byWordWrapping
        texttranslatedLabel.numberOfLines = 0
        texttranslatedLabel.frame.size.width = 300
        texttranslatedLabel.sizeToFit()
        texttranslatedLabel.textColor = UIColor(red: 0x91, green: 0x2f, blue: 0x2a)
        
        translatedtext =  UITextField()
        translatedtext.text = "Press Translate to Start .."
        translatedtext.font = UIFont.systemFont(ofSize: 15)
        translatedtext.borderStyle = UITextField.BorderStyle.roundedRect
        translatedtext.autocorrectionType = UITextAutocorrectionType.no
        translatedtext.keyboardType = UIKeyboardType.default
        translatedtext.returnKeyType = UIReturnKeyType.done
        translatedtext.clearButtonMode = UITextField.ViewMode.whileEditing
        translatedtext.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        translatedtext.setLeftPaddingPoints(10)
        translatedtext.setRightPaddingPoints(10)
        translatedtext.isUserInteractionEnabled = false
        
        let svhz   = UIStackView()
        svhz.axis  = NSLayoutConstraint.Axis.horizontal
        svhz.distribution  = UIStackView.Distribution.equalSpacing
        svhz.spacing   = 10
        svhz.isLayoutMarginsRelativeArrangement = true
        svhz.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        svhz.addArrangedSubview(totranslatetext)
        svhz.translatesAutoresizingMaskIntoConstraints = false
        
        let svhz2   = UIStackView()
        svhz2.axis  = NSLayoutConstraint.Axis.horizontal
        svhz2.distribution  = UIStackView.Distribution.equalSpacing
        svhz2.spacing   = 10
        svhz2.isLayoutMarginsRelativeArrangement = true
        svhz2.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        svhz2.addArrangedSubview(translatedtext)
        svhz2.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonSent = UIButton()
        buttonSent.backgroundColor = .blue
        buttonSent.setTitle("Start to Translate", for: [])
        buttonSent.addTarget(self, action: #selector(doTranslate), for: UIControl.Event.touchUpInside)
        
        let svhz3   = UIStackView()
        svhz3.axis  = NSLayoutConstraint.Axis.horizontal
        svhz3.distribution  = UIStackView.Distribution.equalSpacing
        svhz3.spacing   = 10
        svhz3.isLayoutMarginsRelativeArrangement = true
        svhz3.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20)
        svhz3.addArrangedSubview(buttonSent)
        svhz3.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(sv)
        stackView.addArrangedSubview(texttotranslateLabel)
        stackView.addArrangedSubview(svhz)
        stackView.addArrangedSubview(texttranslatedLabel)
        stackView.addArrangedSubview(svhz2)
        stackView.addArrangedSubview(svhz3)
        
        
    }
    
    private func setupLayout() {
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    @objc func infoBtnPressed (sender: UIBarButtonItem) {
        let aboutInit = aboutInitViewController()
        self.navigationController?.pushViewController(aboutInit, animated: true)
    }
    @objc func doTranslate (sender: UIBarButtonItem) {
        var alert = UIAlertController(title: "Being Translated", message: "Wait for Translating, Please!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)
        var indonesianinput = totranslatetext.text!
        var textFirst="OK Translated"
        textFirst += indonesianinput
        
        //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid
        
        let parameters = ["lang_id_origin": 1, "lang_id_translated": 2, "text": indonesianinput] as [String : Any]
        
        //create the url with URL
        let url = URL(string: GlobalVars.base_url+"/translate")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    let data = json["data"] as? [String: Any]
                    let show_translated_text = data!["text_before_after"]
                    self.translatedtext.text=show_translated_text! as! String
                    
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
}


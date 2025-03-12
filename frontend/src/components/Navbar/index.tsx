import { ReactComponent as GithubIcon } from 'assets/img/github.svg';
import './styles.css'
function Navbar() {
     return (
    <header>
        <nav className="container">
            <div className="tsmovie-nav-content">
                <h1>DSTMovie</h1>
                <a href="https://github.com/tiagotsa">
                    <div className="tsmovie-contact-container">
                        <GithubIcon />
                        <p className="tsmovie-contact-link">/tiagotsa</p>
                    </div>
                </a>
            </div>
        </nav>
    </header>
  );
}

export default Navbar;  
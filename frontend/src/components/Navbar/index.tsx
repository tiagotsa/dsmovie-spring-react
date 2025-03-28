import { ReactComponent as GithubIcon } from 'assets/img/github.svg';
import './styles.css'
function Navbar() {
     return (
    <header>
        <nav className="container">
            <div className="dsmovie-nav-content">
<<<<<<< HEAD
                <h1>TSAMovie</h1>
=======
                <h1>TASMovie</h1>
>>>>>>> 6420299264631a6f017ea50cb0d00ffab18701ba
                <a href="https://github.com/tiagotsa">
                    <div className="dsmovie-contact-container">
                        <GithubIcon />
                        <p className="dsmovie-contact-link">/tiagotsa</p>
                    </div>
                </a>
            </div>
        </nav>
    </header>
  );
}

export default Navbar;
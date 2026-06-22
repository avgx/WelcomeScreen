import SwiftUI

@MainActor
public struct WelcomeScreen<Logo: View>: View {
    
    // MARK: - Properties
    private let appName: String
    private let description: String
    private let logo: Logo
    private let licenseUrl: String
    private let privacyUrl: String
    private let onSignIn: () -> Void
    
    // MARK: - Initialization
    public init(
        appName: String,
        description: String,
        @ViewBuilder logo: () -> Logo,
        licenseUrl: String,
        privacyUrl: String,
        onSignIn: @escaping () -> Void
    ) {
        self.appName = appName
        self.description = description
        self.logo = logo()
        self.licenseUrl = licenseUrl
        self.privacyUrl = privacyUrl
        self.onSignIn = onSignIn
    }
    
    private var legalAgreementText: AttributedString {
        let template = String(localized: "legal-agreement", bundle: .module)
        let markdown = String(format: template, licenseUrl, privacyUrl)
        var options = AttributedString.MarkdownParsingOptions()
        options.interpretedSyntax = .inlineOnlyPreservingWhitespace
        return (try? AttributedString(markdown: markdown, options: options))
            ?? AttributedString(markdown)
    }
    
    // MARK: - Body
    public var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 0)
            
            // Logo
            logo
                .frame(width: 120, height: 120)
                .padding(.bottom, 32)
            
            // Title Section
            VStack(spacing: 12) {
                Text("welcome-to", bundle: .module)
                    .font(.system(size: 44, weight: .heavy, design: .default))
                    .foregroundStyle(.primary)
                
                Text(appName)
                    .font(.system(size: 44, weight: .heavy, design: .default))
                    .foregroundStyle(Color.accentColor)
            }
            .minimumScaleFactor(0.3)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
            .padding(.bottom, 16)
            
            // Description
            Text(description)
                .font(.title3)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(4)
                .padding(.horizontal, 32)
                .padding(.bottom, 48)
            
            Spacer(minLength: 0)
            
            // Sign In Button
            Button(action: onSignIn) {
                Text("sign-in", bundle: .module)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            .frame(maxWidth: 400)
            
            // Legal Agreement Text
            Text(legalAgreementText)
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .tint(.accentColor)
                .padding(.horizontal, 20)
                .padding(.bottom, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        #if os(iOS)
        .background(Color(.systemBackground))
        #endif
        #if os(macOS)
        .background(Color(NSColor.windowBackgroundColor))
        #endif
    }
}

// MARK: - Preview
#Preview {
    let color = Color.red
    WelcomeScreen(
        appName: "AppStore",
        description: "The best way to connect, share, and discover with people you love.",
        logo: {
            Image(systemName: "apple.logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(color)
        },
        licenseUrl: "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/",
        privacyUrl: "https://www.apple.com/legal/privacy/",
        onSignIn: {
            print("Sign in tapped")
        }
    )
    .accentColor(color)
    
}

#Preview("dark") {
    let color = Color.blue
    WelcomeScreen(
        appName: "AppStore",
        description: "The best way to connect, share, and discover with people you love.",
        logo: {
            Image(systemName: "apple.logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(color)
        },
        licenseUrl: "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/",
        privacyUrl: "https://www.apple.com/legal/privacy/",
        onSignIn: {
            print("Sign in tapped")
        }
    )
    .accentColor(color)
    .environment(\.colorScheme, .dark)
    .environment(\.locale, Locale(identifier: "es"))
}

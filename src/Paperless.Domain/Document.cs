namespace Paperless.Domain;

// Defines the shared document metadata model.
public class Document
{
    public Guid Id { get; set; }
    public string Title { get; set; } = string.Empty;
    public string FileName { get; set; } = string.Empty;
    
    public bool Accepted { get; set; }
    public DateTimeOffset CreatedAt { get; set; }
    
    public Guid CreatedBy { get; set; }
}

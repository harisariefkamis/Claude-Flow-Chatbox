import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { ChatBox } from '../src/components/ChatBox';

describe('ChatBox Component', () => {
  beforeEach(() => {
    // Mock API
    global.fetch = jest.fn();
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it('should render chat interface', () => {
    render(<ChatBox />);

    expect(screen.getByText(/Claude Flow Chatbox/i)).toBeInTheDocument();
    expect(screen.getByPlaceholderText(/Ketik pesan/i)).toBeInTheDocument();
    expect(screen.getByRole('button', { name: /Send/i })).toBeInTheDocument();
  });

  it('should send message on button click', async () => {
    (global.fetch as jest.Mock).mockResolvedValueOnce({
      json: async () => ({
        reply: 'Hello from AI!',
        agentsUsed: ['analyzer'],
      }),
    });

    render(<ChatBox />);

    const input = screen.getByPlaceholderText(/Ketik pesan/i);
    const sendButton = screen.getByRole('button', { name: /Send/i });

    await userEvent.type(input, 'Hello AI');
    fireEvent.click(sendButton);

    await waitFor(() => {
      expect(screen.getByText('Hello from AI!')).toBeInTheDocument();
    });
  });

  it('should display loading state while processing', async () => {
    (global.fetch as jest.Mock).mockImplementation(
      () =>
        new Promise((resolve) =>
          setTimeout(
            () =>
              resolve({
                json: async () => ({
                  reply: 'Response',
                  agentsUsed: ['analyzer'],
                }),
              }),
            100
          )
        )
    );

    render(<ChatBox />);

    const input = screen.getByPlaceholderText(/Ketik pesan/i);
    fireEvent.change(input, { target: { value: 'Test' } });
    fireEvent.click(screen.getByRole('button', { name: /Send/i }));

    expect(screen.getByText(/Loading/i)).toBeInTheDocument();

    await waitFor(() => {
      expect(screen.queryByText(/Loading/i)).not.toBeInTheDocument();
    });
  });
});

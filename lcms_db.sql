-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Sep 05, 2025 at 09:53 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lcms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `action` text DEFAULT NULL,
  `target_type` varchar(255) DEFAULT NULL,
  `target_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` bigint(20) NOT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `file_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `course_id`, `title`, `description`, `due_date`, `created_at`, `file_path`) VALUES
(1, 1, 'Bài tập Tiếng Anh số 1', 'Viết một đoạn văn 150 từ về chủ đề \"My Favorite Hobby\".', '2025-08-20 23:59:59', '2025-08-10 09:00:00', NULL),
(2, 1, 'Bài tập Tiếng Anh số 2', 'Nghe đoạn hội thoại và trả lời 10 câu hỏi.', '2025-08-25 23:59:59', '2025-08-10 09:10:00', NULL),
(3, 2, 'Bài tập Toán số 1', 'Giải 10 bài toán về phương trình bậc hai.', '2025-08-22 23:59:59', '2025-08-10 09:20:00', NULL),
(4, 2, 'Bài tập Toán số 2', 'Chứng minh bất đẳng thức Cauchy–Schwarz.', '2025-08-28 23:59:59', '2025-08-10 09:30:00', NULL),
(5, 3, 'Bài tập Lập trình số 1', 'Viết chương trình C++ quản lý sinh viên với các chức năng thêm, sửa, xóa.', '2025-08-21 23:59:59', '2025-08-10 09:40:00', NULL),
(6, 3, 'Bài tập Lập trình số 2', 'Tạo trang web HTML hiển thị thông tin cá nhân kèm CSS.', '2025-08-27 23:59:59', '2025-08-10 09:50:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `name`, `teacher_id`, `created_at`) VALUES
(1, '22BITV05', 2, '2025-09-02 22:02:04'),
(2, '22BLGV01', 3, '2025-09-02 22:02:04'),
(3, '23BLGV02', 2, '2025-09-02 22:02:04'),
(4, '22BITV04', 19, '2025-09-02 22:02:04');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `lesson_id` bigint(20) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) NOT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `teacher_id`, `title`, `description`, `thumbnail`, `created_at`, `updated_at`, `price`) VALUES
(1, 2, 'Khóa học Tiếng Anh cơ bản', 'Học tiếng Anh giao tiếp cho người mới bắt đầu', NULL, '2025-08-12 03:22:08', '2025-08-31 16:46:47', 4000000.00),
(2, 3, 'Khóa học Toán nâng cao', 'Chuyên đề phương trình và bất đẳng thức', NULL, '2025-08-12 03:22:08', '2025-08-31 16:47:46', 3000000.00),
(3, 19, 'Khóa học Lập trình C++', 'Lập trình hướng đối tượng với C++', NULL, '2025-08-12 03:22:08', '2025-08-31 16:47:53', 2500000.00);

-- --------------------------------------------------------

--
-- Table structure for table `course_reviews`
--

CREATE TABLE `course_reviews` (
  `id` bigint(20) NOT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_user`
--

CREATE TABLE `course_user` (
  `id` bigint(20) NOT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_user`
--

INSERT INTO `course_user` (`id`, `course_id`, `user_id`, `created_at`) VALUES
(1, 3, 4, '2025-09-01 01:24:27'),
(2, 3, 5, '2025-09-02 01:15:38'),
(3, 1, 4, '2025-09-06 02:09:06'),
(4, 2, 4, '2025-09-06 02:18:53');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) NOT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `content_url` text DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `course_id`, `title`, `content_type`, `content_url`, `file_path`, `created_at`) VALUES
(1, 1, 'Các thì trong Tiếng Anh (Tenses)', 'pdf', NULL, 'uploads/lessons/placeholder.pdf', '2025-08-24 00:13:53'),
(2, 1, 'Từ vựng về Sở thích (Hobbies Vocabulary)', 'youtube', 'https://www.youtube.com/watch?v=zdlLu_w_pcw', NULL, '2025-08-24 00:13:53'),
(3, 2, 'Lý thuyết và Công thức nghiệm Phương trình bậc hai', 'pdf', NULL, 'uploads/lessons/placeholder.pdf', '2025-08-24 00:13:53'),
(4, 2, 'Video Hướng dẫn chứng minh Bất đẳng thức', 'youtube', 'https://www.youtube.com/watch?v=example_math', NULL, '2025-08-24 00:13:53'),
(5, 3, 'Khái niệm về Lập trình Hướng đối tượng (OOP)', 'youtube', 'https://www.youtube.com/watch?v=example_oop', NULL, '2025-08-24 00:13:53'),
(6, 3, 'Cú pháp cơ bản và cách tạo Class trong C++', 'pdf', NULL, 'uploads/lessons/placeholder.pdf', '2025-08-24 00:13:53'),
(7, 1, 'Bài 1: Bảng chữ cái và phát âm', 'youtube', NULL, NULL, '2025-08-23 22:29:00'),
(8, 1, 'Bài 2: Giới thiệu bản thân và chào hỏi', 'pdf', NULL, NULL, '2025-08-23 22:29:00'),
(9, 1, 'Bài 3: Các thì cơ bản trong tiếng Anh', 'text', NULL, NULL, '2025-08-23 22:29:00'),
(10, 2, 'Chuyên đề 1: Phương trình và bất phương trình bậc hai', 'pdf', NULL, NULL, '2025-08-23 22:29:00'),
(11, 2, 'Chuyên đề 2: Hệ phương trình tuyến tính', 'docx', NULL, NULL, '2025-08-23 22:29:00'),
(12, 2, 'Chuyên đề 3: Giới hạn và continous của hàm số', 'youtube', NULL, NULL, '2025-08-23 22:29:00'),
(13, 3, 'Bài 1: Cài đặt môi trường và chương trình \"Hello World\"', 'text', NULL, NULL, '2025-08-23 22:29:00'),
(14, 3, 'Bài 2: Biến, kiểu dữ liệu và các toán tử cơ bản', 'pdf', NULL, NULL, '2025-08-23 22:29:00'),
(15, 3, 'Bài 3: Cấu trúc điều khiển If-Else và Switch-Case', 'youtube', NULL, NULL, '2025-08-23 22:29:00');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `expires_at` datetime DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'system',
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `is_read`, `created_at`, `expires_at`, `type`, `link`) VALUES
(1, 2, 'Bài tập đã được nộp', 'Học sinh Nguyễn Văn An đã nộp Bài tập Tiếng Anh số 1.', 0, '2025-09-02 23:28:59', NULL, 'system', NULL),
(2, 3, 'Có một câu hỏi mới', 'Một học sinh đã hỏi về Bài tập Toán số 2.', 0, '2025-09-02 23:29:05', NULL, 'system', NULL),
(3, 3, 'Đã hoàn thành khóa học', 'Khóa học Toán nâng cao của bạn đã có một học sinh hoàn thành.', 1, '2025-09-02 23:29:05', NULL, 'system', NULL),
(4, 4, 'Lịch giảng dạy mới', 'Giáo viên Giáo viên Anh Văn đã thêm lịch cho môn Khóa học Tiếng Anh cơ bản vào 09:00 - 11:00.', 1, '2025-09-04 23:14:36', NULL, 'system', '/student/schedule.php'),
(5, 5, 'Lịch giảng dạy mới', 'Giáo viên Giáo viên Anh Văn đã thêm lịch cho môn Khóa học Tiếng Anh cơ bản vào 09:00 - 11:00.', 0, '2025-09-04 23:14:36', NULL, 'system', '/student/schedule.php'),
(6, 6, 'Lịch giảng dạy mới', 'Giáo viên Giáo viên Anh Văn đã thêm lịch cho môn Khóa học Tiếng Anh cơ bản vào 09:00 - 11:00.', 0, '2025-09-04 23:14:36', NULL, 'system', '/student/schedule.php'),
(7, 7, 'Lịch giảng dạy mới', 'Giáo viên Giáo viên Anh Văn đã thêm lịch cho môn Khóa học Tiếng Anh cơ bản vào 09:00 - 11:00.', 0, '2025-09-04 23:14:36', NULL, 'system', '/student/schedule.php'),
(8, 8, 'Lịch giảng dạy mới', 'Giáo viên Giáo viên Anh Văn đã thêm lịch cho môn Khóa học Tiếng Anh cơ bản vào 09:00 - 11:00.', 0, '2025-09-04 23:14:36', NULL, 'system', '/student/schedule.php'),
(9, 9, 'Lịch giảng dạy mới', 'Giáo viên Giáo viên Anh Văn đã thêm lịch cho môn Khóa học Tiếng Anh cơ bản vào 09:00 - 11:00.', 0, '2025-09-04 23:14:36', NULL, 'system', '/student/schedule.php'),
(10, 10, 'Lịch giảng dạy mới', 'Giáo viên Giáo viên Anh Văn đã thêm lịch cho môn Khóa học Tiếng Anh cơ bản vào 09:00 - 11:00.', 0, '2025-09-04 23:14:36', NULL, 'system', '/student/schedule.php'),
(11, 4, 'Lịch giảng dạy mới', 'Giáo viên Giáo viên Anh Văn đã thêm lịch cho môn Khóa học Tiếng Anh cơ bản vào 08:00 - 12:00.', 1, '2025-09-04 23:15:08', NULL, 'system', '/student/schedule.php'),
(12, 5, 'Lịch giảng dạy mới', 'Giáo viên Giáo viên Anh Văn đã thêm lịch cho môn Khóa học Tiếng Anh cơ bản vào 08:00 - 12:00.', 0, '2025-09-04 23:15:08', NULL, 'system', '/student/schedule.php'),
(13, 6, 'Lịch giảng dạy mới', 'Giáo viên Giáo viên Anh Văn đã thêm lịch cho môn Khóa học Tiếng Anh cơ bản vào 08:00 - 12:00.', 0, '2025-09-04 23:15:08', NULL, 'system', '/student/schedule.php'),
(14, 7, 'Lịch giảng dạy mới', 'Giáo viên Giáo viên Anh Văn đã thêm lịch cho môn Khóa học Tiếng Anh cơ bản vào 08:00 - 12:00.', 0, '2025-09-04 23:15:08', NULL, 'system', '/student/schedule.php'),
(15, 8, 'Lịch giảng dạy mới', 'Giáo viên Giáo viên Anh Văn đã thêm lịch cho môn Khóa học Tiếng Anh cơ bản vào 08:00 - 12:00.', 0, '2025-09-04 23:15:08', NULL, 'system', '/student/schedule.php'),
(16, 9, 'Lịch giảng dạy mới', 'Giáo viên Giáo viên Anh Văn đã thêm lịch cho môn Khóa học Tiếng Anh cơ bản vào 08:00 - 12:00.', 0, '2025-09-04 23:15:08', NULL, 'system', '/student/schedule.php'),
(17, 10, 'Lịch giảng dạy mới', 'Giáo viên Giáo viên Anh Văn đã thêm lịch cho môn Khóa học Tiếng Anh cơ bản vào 08:00 - 12:00.', 0, '2025-09-04 23:15:08', NULL, 'system', '/student/schedule.php'),
(18, 6, 'Bài tập đã chấm', 'Bạn đã được chấm bài: Bài tập Tiếng Anh số 2 (3)', 0, '2025-09-06 00:38:30', '2025-10-06 00:38:30', 'grade', '/student/assignments.php?id=1');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `course_id`, `amount`, `payment_date`, `created_at`) VALUES
(1, 2, 1, 500000.00, '2025-08-20 10:00:00', '2025-08-31 16:36:50'),
(2, 3, 2, 750000.00, '2025-08-22 14:30:00', '2025-08-31 16:36:50'),
(3, 2, 3, 250000.00, '2025-08-25 09:15:00', '2025-08-31 16:36:50'),
(4, 4, 1, 500000.00, '2025-08-28 11:00:00', '2025-08-31 16:36:50'),
(5, 3, 3, 250000.00, '2025-08-30 16:45:00', '2025-08-31 16:36:50');

-- --------------------------------------------------------

--
-- Table structure for table `progress_tracking`
--

CREATE TABLE `progress_tracking` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `lesson_id` bigint(20) DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT 0,
  `last_viewed` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progress_tracking`
--

INSERT INTO `progress_tracking` (`id`, `user_id`, `lesson_id`, `is_completed`, `last_viewed`) VALUES
(1, 4, 1, 1, '2025-08-10 09:15:00'),
(2, 4, 2, 0, '2025-08-10 09:30:00'),
(3, 5, 1, 1, '2025-08-10 10:05:00'),
(4, 5, 3, 0, '2025-08-10 10:25:00'),
(5, 6, 2, 1, '2025-08-10 11:00:00'),
(6, 6, 4, 0, '2025-08-10 11:15:00'),
(7, 7, 3, 1, '2025-08-10 13:20:00'),
(8, 7, 4, 1, '2025-08-10 13:45:00'),
(9, 8, 5, 0, '2025-08-10 14:10:00'),
(10, 8, 6, 1, '2025-08-10 14:40:00'),
(11, 9, 5, 1, '2025-08-10 15:05:00'),
(12, 9, 6, 0, '2025-08-10 15:20:00'),
(13, 10, 1, 1, '2025-08-10 16:00:00'),
(14, 10, 2, 1, '2025-08-10 16:25:00'),
(15, 4, 5, 1, '2025-09-01 01:28:12'),
(16, 4, 13, 1, '2025-09-01 01:28:13'),
(17, 4, 14, 1, '2025-09-01 01:28:14'),
(18, 4, 15, 1, '2025-09-01 01:28:15'),
(19, 4, 6, 1, '2025-09-02 01:14:05'),
(20, 5, 13, 1, '2025-09-02 01:15:44'),
(21, 5, 14, 1, '2025-09-02 01:15:49');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint(20) NOT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `time_limit_minutes` int(11) DEFAULT NULL,
  `total_points` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`id`, `course_id`, `title`, `description`, `time_limit_minutes`, `total_points`, `created_at`) VALUES
(1, 1, 'Bài Kiểm Tra Từ Vựng Cơ Bản', 'Kiểm tra kiến thức từ vựng về chủ đề sở thích và gia đình.', 30, 10, '2025-08-25 10:00:00'),
(2, 3, 'Quiz C++: Cấu trúc cơ bản', 'Đánh giá kiến thức về biến, kiểu dữ liệu và toán tử trong C++.', 20, 15, '2025-08-25 11:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_answers`
--

CREATE TABLE `quiz_answers` (
  `id` bigint(20) NOT NULL,
  `attempt_id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `option_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_answers`
--

INSERT INTO `quiz_answers` (`id`, `attempt_id`, `question_id`, `option_id`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 5),
(3, 1, 2, 7),
(4, 1, 2, 9),
(5, 2, 3, 12),
(6, 2, 4, 14),
(7, 2, 4, 16),
(8, 3, 3, 10),
(9, 3, 4, 14);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_attempts`
--

CREATE TABLE `quiz_attempts` (
  `id` bigint(20) NOT NULL,
  `quiz_id` bigint(20) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `started_at` datetime DEFAULT current_timestamp(),
  `submitted_at` datetime DEFAULT current_timestamp(),
  `score` float DEFAULT 0,
  `max_score` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_attempts`
--

INSERT INTO `quiz_attempts` (`id`, `quiz_id`, `student_id`, `started_at`, `submitted_at`, `score`, `max_score`) VALUES
(1, 1, 4, '2025-08-26 04:00:00', '2025-08-26 04:15:00', 5, 5),
(2, 2, 8, '2025-08-26 04:30:00', '2025-08-26 04:40:00', 10, 10),
(3, 2, 4, '2025-09-06 02:23:16', '2025-09-06 02:23:16', 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_options`
--

CREATE TABLE `quiz_options` (
  `id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `option_text` text NOT NULL,
  `is_correct` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_options`
--

INSERT INTO `quiz_options` (`id`, `question_id`, `option_text`, `is_correct`) VALUES
(1, 1, 'Hobby', 1),
(2, 1, 'Homework', 0),
(3, 1, 'House', 0),
(4, 1, 'Holiday', 0),
(5, 2, 'Mother', 1),
(6, 2, 'Table', 0),
(7, 2, 'Sister', 1),
(8, 2, 'Chair', 0),
(9, 2, 'Brother', 1),
(10, 3, 'float', 0),
(11, 3, 'char', 0),
(12, 3, 'int', 1),
(13, 3, 'string', 0),
(14, 4, '=', 1),
(15, 4, '==', 0),
(16, 4, '+=', 1),
(17, 4, '=>', 0),
(18, 4, '*=', 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` bigint(20) NOT NULL,
  `quiz_id` bigint(20) NOT NULL,
  `question_text` text NOT NULL,
  `points` int(11) DEFAULT 1,
  `type` enum('single','multiple') NOT NULL DEFAULT 'single'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `quiz_id`, `question_text`, `points`, `type`) VALUES
(1, 1, 'Từ nào sau đây có nghĩa là \"sở thích\"?', 2, 'single'),
(2, 1, 'Chọn các từ là thành viên trong gia đình.', 3, 'multiple'),
(3, 2, 'Để khai báo một số nguyên trong C++, ta dùng từ khóa nào?', 5, 'single'),
(4, 2, 'Chọn các toán tử gán hợp lệ trong C++.', 5, 'multiple');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) NOT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `day_of_week` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `teacher_id`, `course_id`, `day_of_week`, `start_time`, `end_time`, `location`, `created_at`) VALUES
(1, 2, 1, 2, '08:00:00', '10:00:00', 'Phòng A101', '2025-09-02 23:42:24'),
(2, 3, 2, 4, '14:00:00', '16:00:00', 'Phòng B202', '2025-09-02 23:42:24'),
(3, 19, 3, 5, '09:30:00', '11:30:00', 'Online', '2025-09-02 23:42:24'),
(4, 2, 1, 1, '08:00:00', '12:00:00', 'Phòng A101', '2025-09-04 22:12:03'),
(5, 2, 1, 5, '08:00:00', '12:00:00', 'Phòng A101', '2025-09-04 22:29:02'),
(6, 2, 1, 1, '09:00:00', '11:00:00', 'Phòng A101', '2025-09-04 23:08:50'),
(7, 2, 1, 1, '09:00:00', '11:00:00', 'Phòng A101', '2025-09-04 23:09:03'),
(8, 2, 1, 1, '09:00:00', '11:00:00', 'Phòng A101', '2025-09-04 23:09:50'),
(9, 2, 1, 1, '09:00:00', '11:00:00', 'Phòng A101', '2025-09-04 23:12:40'),
(10, 2, 1, 1, '09:00:00', '11:00:00', 'Phòng A101', '2025-09-04 23:12:41'),
(11, 2, 1, 1, '09:00:00', '11:00:00', 'Phòng A101', '2025-09-04 23:12:41'),
(12, 2, 1, 1, '09:00:00', '11:00:00', 'Phòng A101', '2025-09-04 23:12:55'),
(13, 2, 1, 1, '09:00:00', '11:00:00', 'Phòng A101', '2025-09-04 23:14:36'),
(14, 2, 1, 4, '08:00:00', '12:00:00', 'Phòng A101', '2025-09-04 23:15:08'),
(15, 2, 1, 7, '13:00:00', '16:30:00', 'Phòng A101', '2025-09-05 23:06:24'),
(16, 2, 1, 4, '13:30:00', '14:30:00', 'Phòng A101', '2025-09-05 23:22:09'),
(17, 2, 1, 4, '13:30:00', '14:30:00', 'Phòng A101', '2025-09-05 23:22:10'),
(18, 2, 1, 1, '09:09:00', '12:39:00', 'Phòng A101', '2025-09-05 23:46:35'),
(19, 2, 1, 1, '00:00:00', '13:00:00', 'Phòng A101', '2025-09-05 23:51:54'),
(20, 2, 1, 1, '14:30:00', '18:30:00', 'Phòng A101', '2025-09-05 23:55:43'),
(21, 2, 1, 1, '13:30:00', '18:30:00', 'Phòng A101', '2025-09-06 00:00:00'),
(22, 2, 1, 3, '18:00:00', '21:10:00', 'Phòng A101', '2025-09-06 00:38:57');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_key`, `setting_value`, `created_at`, `updated_at`) VALUES
(1, 'theme', 'light', '2025-09-04 04:31:11', '2025-09-04 15:04:53');

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `id` bigint(20) NOT NULL,
  `assignment_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `submitted_at` datetime DEFAULT current_timestamp(),
  `grade` float DEFAULT NULL,
  `feedback` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submissions`
--

INSERT INTO `submissions` (`id`, `assignment_id`, `student_id`, `file_path`, `submitted_at`, `grade`, `feedback`) VALUES
(1, 1, 4, 'uploads/assignments/1_student4.docx', '2025-08-15 10:30:00', 8.5, 'Bài viết khá tốt, cần chú ý ngữ pháp.'),
(2, 1, 5, 'uploads/assignments/1_student5.docx', '2025-08-15 11:15:00', 9, 'Bài viết rõ ràng và mạch lạc.'),
(3, 2, 6, 'uploads/assignments/2_student6.docx', '2025-08-18 09:45:00', 3, 'Chưa nắm rõ kiến thức'),
(4, 3, 4, 'uploads/assignments/3_student4.pdf', '2025-08-16 14:20:00', 7, 'Cần trình bày sạch sẽ hơn.'),
(5, 3, 7, 'uploads/assignments/3_student7.pdf', '2025-08-16 15:10:00', 9.5, 'Bài giải chính xác và trình bày tốt.'),
(6, 4, 8, 'uploads/assignments/4_student8.pdf', '2025-08-19 08:55:00', NULL, NULL),
(7, 5, 9, 'uploads/assignments/5_student9.zip', '2025-08-17 20:00:00', 10, 'Hoàn thành xuất sắc.'),
(8, 6, 10, 'uploads/assignments/6_student10.zip', '2025-08-18 19:30:00', 8, 'Code chạy tốt, nhưng cần tối ưu hơn.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_token_expires_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_of_birth` date DEFAULT NULL,
  `avatar_url` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `avatar`, `phone`, `reset_token`, `reset_token_expires_at`, `created_at`, `updated_at`, `date_of_birth`, `avatar_url`) VALUES
(1, 'Admin Quản Trị', 'admin@lms.com', '$2y$10$4L/NwJ6sbtH7CveTsEj9F..XVwiTbiFcMpao/0mJXu1mo75KhQpHC', 'admin', NULL, NULL, NULL, NULL, '2025-08-05 11:16:35', '2025-08-23 14:04:10', NULL, NULL),
(2, 'Giáo viên Anh Văn', 'teacher.anhvan@lms.com', '$2y$10$NDaJwpBi3RpADflO1XE/IOfXqWh9cdQbo4LWX3Lk46O3YMxNo81bi', 'teacher', NULL, NULL, NULL, NULL, '2025-08-05 11:16:35', '2025-08-23 14:04:10', NULL, NULL),
(3, 'Giáo viên Toán', 'teacher.toan@lms.com', '$2y$10$rC/GEsECpFryFw1/qR1GpeReZzPCd9Gpwg.3OTj6ror6UZe8aFjbW', 'teacher', NULL, NULL, NULL, NULL, '2025-08-05 11:16:35', '2025-08-23 14:04:10', NULL, NULL),
(4, 'Nguyễn Văn An', 'student.an@lms.com', '$2y$10$M7Vmey4tOW9hCKwAfGKhUO/EfIJ0Mj7fX1B.DMJMRlqX6hYvLzUJa', 'student', NULL, '0989127583', NULL, NULL, '2025-08-05 11:16:35', '2025-08-31 17:42:19', NULL, NULL),
(5, 'Trần Thị Bình', 'student.binh@lms.com', '$2y$10$x6ikEmYAIcmOnzQ14U1YSOxIiCHQd/YNnb8lPygE5x.3/4ntnqz8O', 'student', NULL, '0947391284', NULL, NULL, '2025-08-05 11:16:35', '2025-08-31 17:42:35', NULL, NULL),
(6, 'Lê Văn Cường', 'student.cuong@lms.com', '$2y$10$LbKjv0H3HgQH1/4C50KgMOD3CRwYZpp.ZbrnitBBLmi4.Fx4fZt.m', 'student', NULL, '0957483164', NULL, NULL, '2025-08-05 11:16:35', '2025-08-31 17:42:44', NULL, NULL),
(7, 'Phạm Thị Dung', 'student.dung@lms.com', '$2y$10$SF9bQdDd3swfrnzB.pIBfekfY9Akr9vYdEkDO3.QU1hj2V3InibiK', 'student', NULL, NULL, NULL, NULL, '2025-08-05 11:16:35', '2025-08-23 14:04:10', NULL, NULL),
(8, 'Võ Văn Giang', 'student.giang@lms.com', '$2y$10$/4FZW3.vNWk6T6nDf/mhI.Kbdb7Hu16rs/xq2GqhW041gRwAftAGm', 'student', NULL, NULL, NULL, NULL, '2025-08-05 11:16:35', '2025-08-23 14:04:10', NULL, NULL),
(9, 'Đỗ Thị Hương', 'student.huong@lms.com', '$2y$10$WSBl3PATabuUWbBO3IgSiesEgHevE9mv7eMTHc/JZZmfU69zHFd1C', 'student', NULL, NULL, NULL, NULL, '2025-08-05 11:16:35', '2025-08-23 14:04:10', NULL, NULL),
(10, 'Hoàng Văn Khánh', 'student.khanh@lms.com', '$2y$10$.NDuKA1NqalWIhli9sYk.O1zO0NWoH2oHfq3QQGmY69zYEcMratfC', 'student', NULL, NULL, NULL, NULL, '2025-08-05 11:16:35', '2025-08-23 14:04:10', NULL, NULL),
(19, 'Giáo Viên Lập Trình', 'teacher.laptrinh@lms.com', '$2y$10$AsKSye//jJLuxWg2gjJ6meifw.FmGsga.hBzh5hFAW1.YbyrLqywO', 'teacher', NULL, NULL, NULL, NULL, '2025-08-23 22:22:34', '2025-08-23 22:22:34', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_assignment_course` (`course_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_course_teacher` (`teacher_id`);

--
-- Indexes for table `course_reviews`
--
ALTER TABLE `course_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `course_user`
--
ALTER TABLE `course_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_id` (`course_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lesson_course` (`course_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `progress_tracking`
--
ALTER TABLE `progress_tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_id` (`lesson_id`),
  ADD KEY `idx_progress_user_lesson` (`user_id`,`lesson_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_quiz_course` (`course_id`);

--
-- Indexes for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_answer_attempt` (`attempt_id`),
  ADD KEY `idx_answer_question` (`question_id`),
  ADD KEY `idx_answer_option` (`option_id`);

--
-- Indexes for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_attempt_quiz` (`quiz_id`),
  ADD KEY `idx_attempt_student` (`student_id`);

--
-- Indexes for table `quiz_options`
--
ALTER TABLE `quiz_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_option_question` (`question_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_question_quiz` (`quiz_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_schedule_teacher` (`teacher_id`),
  ADD KEY `fk_schedule_course` (`course_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_submission_assignment` (`assignment_id`),
  ADD KEY `idx_submission_student` (`student_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_user_role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course_reviews`
--
ALTER TABLE `course_reviews`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_user`
--
ALTER TABLE `course_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `progress_tracking`
--
ALTER TABLE `progress_tracking`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quiz_options`
--
ALTER TABLE `quiz_options`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `course_reviews`
--
ALTER TABLE `course_reviews`
  ADD CONSTRAINT `course_reviews_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_reviews_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `course_user`
--
ALTER TABLE `course_user`
  ADD CONSTRAINT `course_user_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `progress_tracking`
--
ALTER TABLE `progress_tracking`
  ADD CONSTRAINT `progress_tracking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `progress_tracking_ibfk_2` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `fk_quiz_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD CONSTRAINT `fk_answer_attempt` FOREIGN KEY (`attempt_id`) REFERENCES `quiz_attempts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_answer_option` FOREIGN KEY (`option_id`) REFERENCES `quiz_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_answer_question` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD CONSTRAINT `fk_attempt_quiz` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_attempt_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_options`
--
ALTER TABLE `quiz_options`
  ADD CONSTRAINT `fk_option_question` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `fk_question_quiz` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `fk_schedule_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_schedule_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `submissions_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `submissions_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

<?php
declare(strict_types=1);

// Sử dụng các file cấu hình và trợ giúp chung
require __DIR__ . '/api/config.php';
require __DIR__ . '/api/helpers.php';

// Yêu cầu người dùng phải đăng nhập
$user = require_login();
$user_id = (int)$user['id'];

// Lấy kết nối CSDL
$pdo = db();

// --- BƯỚC 1: LẤY DỮ LIỆU CÁC KHÓA HỌC ĐÃ GHI DANH ---
$sql_courses = "
    SELECT
        c.id, c.title, c.thumbnail, t.name as teacher_name,
        (SELECT COUNT(*) FROM lessons WHERE course_id = c.id) as total_lessons,
        (SELECT COUNT(*) FROM progress_tracking WHERE user_id = ? AND lesson_id IN (SELECT id FROM lessons WHERE course_id = c.id) AND is_completed = 1) as completed_lessons
    FROM courses c
    JOIN course_user cu ON c.id = cu.course_id
    LEFT JOIN users t ON c.teacher_id = t.id
    WHERE cu.user_id = ?
";
$stmt_courses = $pdo->prepare($sql_courses);
$stmt_courses->execute([$user_id, $user_id]);
$enrolled_courses = $stmt_courses->fetchAll();

// --- BƯỚC 2: LẤY DỮ LIỆU CÁC BÀI TẬP SẮP TỚI HẠN ---
$sql_assignments = "
    SELECT
        a.title as assignment_title, c.title as course_title, a.due_date
    FROM assignments a
    JOIN courses c ON a.course_id = c.id
    WHERE a.course_id IN (SELECT course_id FROM course_user WHERE user_id = ?)
    AND a.due_date > NOW()
    ORDER BY a.due_date ASC
    LIMIT 5
";
$stmt_assignments = $pdo->prepare($sql_assignments);
$stmt_assignments->execute([$user_id]);
$upcoming_assignments = $stmt_assignments->fetchAll();

?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Chủ - MyLMS</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/feather-icons"></script>
    <link rel="stylesheet" href="style.css">
</head>
<body class="bg-gray-50">

    <header id="header" class="bg-white/80 backdrop-blur-md sticky top-0 z-50 shadow-md">
        <div class="container mx-auto px-6 py-4 flex justify-between items-center">
            <a href="trang-chu.php" class="text-2xl font-bold text-indigo-600">MyLMS</a>
            <nav class="hidden md:flex space-x-8 items-center">
                <a href="trang-chu.php" class="text-indigo-600 font-semibold">Trang Chủ</a>
                <a href="courses.php" class="text-gray-600 hover:text-indigo-600">Khám Phá</a>
                <a href="profile.php" class="text-gray-600 hover:text-indigo-600">Hồ Sơ</a>
                <a href="logout.php" class="text-gray-600 hover:text-indigo-600">Đăng Xuất</a>
            </nav>
        </div>
    </header>

    <main class="container mx-auto px-6 py-12">
        <div class="mb-8">
            <h1 class="text-3xl md:text-4xl font-bold text-gray-900 mb-2">Chào mừng trở lại, <?php echo htmlspecialchars($user['name']); ?>!</h1>
            <p class="text-lg text-gray-600">Hãy tiếp tục hành trình học tập của bạn.</p>
        </div>
        
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2">
                <section>
                    <h2 class="text-2xl font-bold text-gray-800 mb-4">Các Khóa Học Của Tôi</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                        <?php if (empty($enrolled_courses)): ?>
                            <div class="md:col-span-2 text-center bg-white p-8 rounded-lg shadow-sm">
                                <p class="text-gray-600">Bạn chưa được ghi danh vào khóa học nào.</p>
                                <a href="courses.php" class="mt-4 inline-block bg-indigo-600 text-white px-5 py-2 rounded-lg hover:bg-indigo-700">Khám phá các khóa học</a>
                            </div>
                        <?php else: ?>
                            <?php foreach ($enrolled_courses as $course): ?>
                                <?php
                                    $progress = $course['total_lessons'] > 0 ? round(($course['completed_lessons'] / $course['total_lessons']) * 100) : 0;
                                    $thumbnail = $course['thumbnail'] ?: 'https://placehold.co/600x400/e0e7ff/4338ca?text=' . urlencode($course['title']);
                                ?>
                                <div class="course-card">
                                    <a href="chi-tiet-khoa-hoc.php?id=<?php echo $course['id']; ?>">
                                        <img src="<?php echo htmlspecialchars($thumbnail); ?>" alt="Course Thumbnail" class="course-thumbnail">
                                    </a>
                                    <div class="p-6">
                                        <h3 class="text-xl font-bold text-gray-900 mb-2 h-14"><?php echo htmlspecialchars($course['title']); ?></h3>
                                        <p class="text-gray-600 text-sm mb-4">GV: <?php echo htmlspecialchars($course['teacher_name'] ?? 'Chưa xác định'); ?></p>
                                        <div class="mb-4">
                                            <div class="flex justify-between text-sm text-gray-600 mb-1">
                                                <span>Tiến độ</span>
                                                <span><?php echo $progress; ?>%</span>
                                            </div>
                                            <div class="progress-bar-container">
                                                <div class="progress-bar" style="width: <?php echo $progress; ?>%;"></div>
                                            </div>
                                        </div>
                                        <a href="chi-tiet-khoa-hoc.php?id=<?php echo $course['id']; ?>" class="font-semibold text-indigo-600 hover:text-indigo-800">Vào học →</a>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </div>
                </section>
            </div>

            <div class="lg:col-span-1">
                <aside class="bg-white p-6 rounded-lg shadow-sm sticky top-24">
                    <h3 class="text-xl font-bold text-gray-900 mb-4">🔔 Bài Tập Sắp Tới Hạn</h3>
                    <ul class="space-y-4">
                        <?php if (empty($upcoming_assignments)): ?>
                            <li>
                                <p class="text-gray-500">Tuyệt vời! Bạn không có bài tập nào sắp tới hạn.</p>
                            </li>
                        <?php else: ?>
                            <?php foreach ($upcoming_assignments as $assignment): ?>
                                <?php
                                    $dueDate = new DateTime($assignment['due_date']);
                                    $formattedDate = $dueDate->format('H:i, d/m/Y');
                                ?>
                                <li class="border-l-4 border-red-400 pl-4">
                                    <p class="font-semibold text-gray-800"><?php echo htmlspecialchars($assignment['assignment_title']); ?></p>
                                    <p class="text-sm text-gray-500">Khóa học: <?php echo htmlspecialchars($assignment['course_title']); ?></p>
                                    <p class="text-sm text-red-600 font-medium">Hạn chót: <?php echo $formattedDate; ?></p>
                                </li>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </ul>
                </aside>
            </div>
        </div>
    </main>
    
    <script>
        // Giữ lại script cho các icon và có thể cho nút logout nếu muốn
        feather.replace();
    </script>
</body>
</html>

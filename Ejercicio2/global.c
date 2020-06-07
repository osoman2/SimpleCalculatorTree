#include <stdlib.h>
#include <string.h>
#include <stdio.h>

struct Node {
    char data[3];
    struct Node *left;
    struct Node *right;
};

struct ExpressionTree {
    struct Node *root;
};

struct Node* newNode(const char *content) {
    struct Node *result = malloc(sizeof(struct Node));
    strcpy(result->data, content);
    result->left = NULL;
    result->right = NULL;
    return result;
}

struct ExpressionTree* newTree() {
    struct ExpressionTree *result = malloc(sizeof(struct ExpressionTree));
    result->root = NULL;
    return result;
}

void print2DUntil(struct Node *root, int space, int distance) {
    if (root == NULL) {
        return;
    }
    space += distance;
    print2DUntil(root->right, space, distance);
    for (int i = distance; i < space; i++) {
        printf(" ");
    }
    printf("%s\n", root->data);
    print2DUntil(root->left, space, distance);
}

void print2DTree(struct Node *root, int distance) {
    print2DUntil(root, 0, distance);
}